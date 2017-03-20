require 'spec_helper'

describe SimpleTextEditor do
	let(:base_content) { "Hello world " }	

	let(:editor_empty) { SimpleTextEditor::Editor.new }
	let(:editor) { SimpleTextEditor::Editor.new(base_content) }


	describe '#process' do
		
		describe 'Basic pack' do

			it 'Calls append method' do
				editor.stub(:op__append)
				expect(editor).to receive(:op__append).with("abc").once
				editor.process "1 abc"
			end

			it 'Calls delete method' do
				editor.stub(:op__delete)
				expect(editor).to receive(:op__delete).with("3").once
				editor.process "2 3"
			end

			it 'Calls print method' do
				editor.stub(:op__print)
				expect(editor).to receive(:op__print).with("5").once
				editor.process "3 5"
			end

			it 'Calls undo method' do
				editor.stub(:op__undo)
				expect(editor).to receive(:op__undo).once
				editor.process "4"
			end

			it 'Calls invalid when an invalid operation is entered' do
				editor.stub(:op__invalid)
				expect(editor).to receive(:op__invalid).once
				editor.process "-1 Hello"
			end

		end

	end

	describe 'Operations' do 
		
		describe 'Basic pack' do

			describe 'Append' do

				it 'adds "abc" to an empty string' do
					editor_empty.op__append("abc")			
					expect(editor_empty.content).to eq "abc"
				end

				it 'adds "abc" to an existing string' do
					editor.op__append("abc")			
					expect(editor.content).to eq (base_content + "abc")
				end

			end

			describe 'Delete' do

				it 'does nothing when string is empty' do
					editor_empty.op__delete(0)
					expect(editor_empty.content).to eq ""
				end

				it 'removes the last k elements when k is greater than length' do
					k = base_content.length * 3
					editor.op__delete(k)
					expect(editor.content).to eq ("")
				end

				it 'removes the last 3 characters' do
					editor.op__delete(3)
					expect(editor.content).to eq (base_content[0..-4])
				end

			end

			describe 'Print' do

				it 'displays nothing when the index is out of range' do
					k = base_content.length * 3
					call_print = Proc.new {
						editor_empty.op__print(k)
					}

					expect(call_print).to output("\n").to_stdout
				end

				it 'displays the third character' do
					k = 3
					call_print = Proc.new {
						editor.op__print(k)
					}
					expect(call_print).to output(base_content[2] + "\n").to_stdout
				end
			end

			describe 'Undo' do

				it 'Returns empty state when the editor has no previous states' do
					editor.op__undo
					expect(editor.content).to eq ""
				end

				it 'Returns previous state' do
					editor.op__append("abc")
					editor.op__undo
					expect(editor.content).to eq base_content
				end
			
			end
		end
	end
  
end