$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'image'

module Day08
  describe Image do
    it 'can render a single layer' do
      image = Image.new([1,0,0,1,0,1], w: 3, h:2)
      expect(image.render).to eq [
        "#  ",
        "# #",
      ]
    end

    it 'digs through transparent layers' do
      image = Image.new(
        [
          0,2,
          2,2,

          1,1,
          2,2,

          2,2,
          1,2,

          0,0,
          0,0
        ],
        w:2, h:2
      )

      expect(image.render).to eq [
        ' #',
        '# '
      ]
    end
  end
end
