## Can you explain what TDD is and why we use it?

- ** What is it? **
- process of writing tests to guide the writing of code that meets user needs

- ** Why? **
- helps break down the problem
- Test can sever as documentation
- ** Test in general **
- As the project gets larger it acts as a safety net

## Can you test drive a small program?

** Piggy Bank **

### User needs

- Helps store money
- Destroy + taking all the money out
- Discourage people from taking it out
- Write user stories ( 3 components, first line who can do the things)
- Define user stories (choose one user story first )
- Unit a test - feature test
- Shaking it will tell you if there is money

--
As a user
So I can save up money
I want to store it in a piggy bank
--
User, who can use the program
More context, why you want to do it
The last line is the most useful information, one verb and one noun
** N.B First two lines are generally for context **
--

Design Model

| Object | Method |
| --- | --- |
| User | |
| Money | Save |
| Piggy Bank | Store |

--

Next step is write a test (specifically a feature test)

** Feature test (irb) **

```
piggy_bank = PiggyBank.new
piggy_bank.store(1)
=> 'clink'
```

When you are testing something you want to ask yourself what is the behaviour you are expecting.

| Input | Output |
| --- | --- |
| 1 | "clink" |
| 2 | "clink" |
| 0 | nil |

```
mkdir lib
mkdir spec
touch spec/piggy_bank_spec.rb
```

Inside piggy_bank_spec.rb
```
describe PiggyBank do
  describe "#store" do
    it "should return 'clink' when I store 1 pound" do
      # good convention to write it as follows
      # expect().to eq()
      # expect to equal
      expect(piggy_bank.store(1)).to eq('clink')
    end
  end
end
```

Run rspec
To solve NameError:
In terminal
```
touch piggy_bank.rb
```

Inside piggy_bank_spec.rb
```
require 'piggy_bank'
# rest of code
it "should return 'clink' when I store 1 pound" do
  expect(subject.store(1)).to eq('clink')
end
```

Inside piggy_bank.rb
```
class PiggyBank
  def store(amount)
    "clink"
  end
end
```

Key words in rspec file
expect(MATCHER) to eq | to raise_error
describe
it

** REFACTOR **

Second test
Inside piggy_bank_spec.rb
```
# rest of code
it "should return 'clink' when I store 2 pounds" do
  expect(subject.store(2)).to eq('clink')
end
```
Passes without writing new code

Third test
Inside piggy_bank_spec.rb
```
require 'piggy_bank'
# rest of code
  it "should return 'clink' when I store 0 pounds" do
  expect(subject.store(0)).to eq(nil)
end
```
Fails
Try to fix with most simple way
Inside piggy_bank.rb
```
class PiggyBank
  def store(amount)
    "clink" if amount > 0
  end
end
```

Should only test for the behaviour and not the state. Test from user perspective

## Second User story
As a user
So I can spend money
I want to take money out of the piggy bank

** Feature test in irb **
```
piggy_bank = PiggyBank.new
piggy_bank.destroy
=> 0
```

| Input | Output |
| --- | --- |
| store(1) | 1 |
| store(2), store(1) | 3 |
| PiggyBank.new | 0 |

Unit testing (piggy_bank_spec.rb)

```
  # rest of code
  describe "#destroy" do
    it "should return 1 when I had stored 1 pound in it" do
      # arrange
      piggy_bank = PiggyBank.new
      piggy_bank.store(1)
      # act ...... assertion
      expect(piggy_bank.destroy).to eq (1)
    end
  end
```

inside piggy_bank.rb
```
  # more code
  def destroy
  end
```

New command
rspec -fd
shows the errors in a different way
