# SimpleTextEditor

This Simple Text Editor gem solves the coding challange on [HackerRank](https://www.hackerrank.com/challenges/simple-text-editor).

To experiment with that code, run `bin/console` for an interactive prompt.

To execute the rspec tests run `bundle exec rake spec`


## Installation
Add this line to your application's Gemfile:

```ruby
gem "simple_text_editor", '0.1', :git => "git://github.com/amrani/simple_text_editor.git"
```

And then execute:

    $ bundle

## Usage
Operations:
1. append(w) - Append string w to the end of s.
2. delete(k)- Delete the last k characters of s.
3. print(k)- Print the k character of s.
4. undo()- Undo the last (not previously undone) operation of type 1 or 2, reverting S to the state it was in prior to that operation.
 
Please visit the [HackerRank challenge](https://www.hackerrank.com/challenges/simple-text-editor) for details.

## Import HackerRank Test File
Open the console with `bin/console` or in an existing project.
Then run 

```ruby
SimpleTextEditor::Import::HackerRankFile.new "./path/to/input.txt"
```

##### Sample HackerRank Input
```
8
1 abc
3 3
2 3
1 xy
3 2
4 
4 
3 1
```

##### Sample HackerRank Output 
```
c
y
a
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

