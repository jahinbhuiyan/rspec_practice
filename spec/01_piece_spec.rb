require 'rspec'
require '01_piece'

describe Piece do
    let(:board){double("Board", valid_pos?: true) }
    subject(:piece){Piece.new(:white, board, [0,0]) }

    describe '#initialize' do 
        context 'the argument passed are correct ' do
            it 'instantiates a piece correctly' do 
                # piece = Piece.new(:white, [0,0])

                expect(piece.color).to be(:white)
                expect(piece.pos).to eq([0, 0])
                expect(piece.board).to be_truthy 
            end
        end
        context 'the arguments passed are incorrect' do
            it 'raises an error when provided an invalid color' do
                expect {Piece.new(:blue, board, [0,0])}.to raise_error('Invalid color')
            end
            it 'raises an error when provided an invalid position' do
                expect {Piece.new(:white, board, [9,9])}.to raise_error('Invalid position')
            end
        end
    end

    
    
    describe '#pos=' do
        # piece = Piece.new(:white, [0,0])
        before (:each) {piece.pos = [1,1]}

        it 'correctly reassings a piece\'s position' do
            # piece.pos = [1,1]


            expect(piece.pos).to eq([1,1])
        end
    end

    describe '#symbol' do
        # piece = Piece.new(:white, [0,0])

        it 'raises an error' do
            expect {piece.symbol}.to raise_error(NotImplementedError)
        end
    end

    describe '#to_s' do
        it 'returns a formatted string of our pieces' do
            piece = Piece.new(:white, board, [0,0])
            allow(piece).to receive(:symbol).and_return(' r ')

            expect(piece.to_s()).to eq(' r ')
        end
    end


end