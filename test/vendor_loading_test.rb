require File.dirname(__FILE__) + '/helper'

context "Vendor Loading" do

  setup do
    Sinatra.application = nil
  end
  
  context "(in general)" do

    setup do
      Sinatra.application = nil
    end

    specify "should identify the vendor directory automatically" do

      Sinatra.application.options.vendor.to_s.should.equal Dir.pwd + "/vendor"

    end
    
    specify "should allow override of vendor directory" do
    
      Sinatra.application.options.vendor = Dir.pwd + "/sharp_pointy_teeth"
      Sinatra.application.options.vendor.to_s.should.equal Dir.pwd + "/sharp_pointy_teeth"
    
    end
    
    specify "should autoload sample module" do
      
      get '/' do
        echo('Testing 1, 2, 3')
      end
      
      get_it '/'
      should.be.ok
      body.should.equal 'Testing 1, 2, 3'
    end
    
    specify "should support reloading" do
      get '/' do
        echo('Testing 1, 2, 3')
      end
      
      get_it '/'
      
      Sinatra.application.reload!
      
      get '/' do
        echo('Testing 1, 2, 3')
      end
      
      get_it '/'
      should.be.ok
      body.should.equal 'Testing 1, 2, 3'
    end
    
  end

end
