class HomeAction < Cramp::Action
  def start
    render "Hello Lepra and kinzoid!"
    finish
  end
end
