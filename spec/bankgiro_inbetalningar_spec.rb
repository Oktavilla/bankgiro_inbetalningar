require_relative 'spec_helper'

describe BankgiroInbetalningar do
  context "parsing a minimal file" do
    subject { BankgiroInbetalningar.parse(fixture_path('minimal.txt')) }

    it "finds the timestamp" do
      subject.timestamp.should == "2004 05 25 173035 010331".gsub(' ','').to_i
    end
    it "finds 1 deposit" do
      subject.deposits.count.should == 1
    end
    it "finds 1 payment" do
      subject.deposits.first.payments.count.should == 1
    end
  end
end