## Team Members
[Megan Byers](https://github.com/coloradical), [Lucas Reed](https://github.com/lure7991), [Lindsay Walton](https://github.com/lawalton) & [Elliot Whitehead](https://github.com/elliotwhitehead)

## SummitPlan
The go-to website for planning your next 14er adventure!

## Team Name
The Mountaineers

## Vision Statement
We want to make it easier for mountain enthusiasts to find the perfect 14er for their outing, and to ensure the safety and education of new climbers.

## Automated Tests
For automated testing, we will be using [Minitest](http://ruby-doc.org/stdlib-2.0.0/libdoc/minitest/rdoc/MiniTest.html) which comes built-in with [Rails](http://guides.rubyonrails.org/testing.html)!
For testing, we first write tests in the appropriate ruby file. For example, I'll illustrate what it looks like to run a simple autmoated test on our `Fourteener` class.

Here's the test which validate that a `fourteener` cannot be saved to our database without a name.

`app/test/models/fourteener_test.rb`

``` ruby
require 'test_helper'

class FourteenerTest < ActiveSupport::TestCase
	test "should not save fourteener without name" do
		fourteener = Fourteener.new
		assert_not fourteener.save
	end
end
```

Basically, this test creates an empty `fourteener` and uses `assert_not` while attempting to save it to the database. So, if functioning properly, the `.save` should be rejected, and `assert_not` should return `true`, thus passing the test. 
Let's try it out. 

To run this test, we execute the following command on our Docker web container.
```
docker-compose run web rails test test/models/fourteener_test.rb
```

This yields:

``` shell
Starting dockerrails_db_1 ... done
Running via Spring preloader in process 20

Called from /usr/local/bundle/gems/activesupport-5.0.0.1/lib/active_support/dependencies.rb:259:in 'load_dependency'
Run options: --seed 35358

# Running:

'F

Failure:
FourteenerTest#test_should_not_save_fourteener_without_a_name [/myapp/test/models/fourteener_test.rb:6]:
Expected true to be nil or false'


bin/rails test test/models/fourteener_test.rb:4



Finished in 0.099865s, 10.0135 runs/s, 10.0135 assertions/s.

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
```
	
**_What? Shouldn't it have passed?_**

Not yet.

We haven't actually written any code which ensures this validation!
Adding the following to our `app/models/fourteeners.rb` file will ensure that the fourteeners cannot be saved to the data base without a name.

``` ruby
class Fourteener < ApplicationRecord
	validates :name, presence: true
end
```

Now let's run that test again:

```bash
Starting dockerrails_db_1 ... done
Running via Spring preloader in process 20

Called from /usr/local/bundle/gems/activesupport-5.0.0.1/lib/active_support/dependencies.rb:259:in 'load_dependency'
Run options: --seed 38410

# Running:

.

Finished in 0.084607s, 11.8194 runs/s, 11.8194 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

Success! 1 test ran, 0 failed! And so goes our automated testing... 



## User Acceptance Tests
| UAT # |                     Action                     | Expected Outcome                                                                     | Pass | Fail |
|-------|:----------------------------------------------:|--------------------------------------------------------------------------------------|------|------|
| 1     | Load the webpage to see fourteeners on map     | Main page loads, Google Maps displayed, fourteeners visible on map                   |   X   |   X   |
| 2     | Filter list of fourteeners based on difficulty | Google map shows the updated list of fourteeners that match the requested diffeculty |      |      |
| 3     | Post a comment about a fourteener route        | Comment shows up on that fourteener's listing                                        |   X   |   X   |
