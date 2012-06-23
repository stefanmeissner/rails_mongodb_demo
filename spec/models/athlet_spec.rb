require 'spec_helper'

describe Athlet do
  
  before { @athlet = Athlet.new(first_name: "Test", last_name: "User") }

  subject { @athlet }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
end
