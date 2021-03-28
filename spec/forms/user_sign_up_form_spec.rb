require 'rails_helper'

RSpec.describe UserSignUpForm do
    let(:call) {form.save}
    let(:form) {described_class.new(params)}
    let(:user){build(:user)}
    let(:params) {{email: user.email,
                nickname: user.nickname, 
                password: user.password, 
                password_confirmation: user.password_confirmation
                }}

    context "User with valid params" do
        it 'saves' do
            expect(call).to eq true
        end
    end

    context "User with invalid" do 
        
            context "email presence" do
                let(:params) {{ email: nil }}
                it 'dont save' do
                    expect(call). to eq false
                end
            end

            context "email format" do
                let(:params) {{ email: 'bademail'}}
                it 'dont save' do
                    expect(call). to eq false
                end
            end

            context "email uniqueness" do
                let(:user){create(:user)}
                it 'dont save' do
                    expect(call). to eq false
                end
            end

            context "nickname uniqueness" do
                let(:user){create(:user)}
                it 'dont save' do
                    expect(call). to eq false
                end
            end

            context "password presence" do
                let(:params) {{password: nil}}
                it 'dont save' do
                    expect(call). to eq false
                end
            end

            context "password confirmation presence" do
                let(:params) {{password_confirmation: nil}}
                it 'dont save' do
                    expect(call). to eq false
                end
            end

            context "password confirmation" do
                let(:params) {{password: 'password', password_confirmation: 'passwd'}}
                it 'dont save' do
                    expect(call). to eq false
                end
            end
    end
end