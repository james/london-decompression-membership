require 'rails_helper'

RSpec.describe Member, type: :model do
  it "should assign a membership number from codes" do
    code1 = MembershipCode.create!(code: '2398eu')
    MembershipCode.create!(code: 'sdt345', taken: true)
    member = Member.create!(first_name: 'James', last_name: 'Darling', email: 'james@test.com')
    expect(member.membership_number).to eq('2398eu')
    expect(code1.reload.taken?).to be(true)
  end

  it "should assign nil membership number if no available codes" do
    MembershipCode.create!(code: '2398eu', taken: true)
    MembershipCode.create!(code: 'sdt345', taken: true)
    member = Member.create!(first_name: 'James', last_name: 'Darling', email: 'james@test.com')
    expect(member.membership_number).to eq(nil)
  end
end
