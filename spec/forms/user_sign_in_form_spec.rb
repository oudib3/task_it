require 'rails_helper'

RSpec.describe UserSignInForm do
    let(:call) {form.valid?}
    let(:form){described_class.new(params)}
    let(:params) {{email: user.email, password: user.password}}
    let(:user){create(:user)}

    context 'input with valid params' do
        context 'when user exists' do
            it 'returns user' do
                expect(call). to eq true
                expect(form.user). to eq(user)
            end
        end

        context 'and invalid credentials' do
            let(:params) {{password: 'badpasswd'}}
            it 'dont return user and adds error to form' do
                expect(call).to eq false
                expect(form.errors[:base]).to include("Invalid Credentials")
            end
        end
    end

    context 'input with invalid' do
        context 'email presence' do
            let(:params) {{email: nil}}
            it 'returns error' do
                expect(call).to eq false
                expect(form.errors.full_messages). to include("Email can't be blank")
            end
        end
        context 'email format' do
            let(:params) {{email: 'wrong email'}}
            it 'returns error' do
                expect(call). to eq false
                expect(form.errors.full_messages). to include("Email is invalid")
            end
        end
        context 'password presence' do
            let(:params) {{password: nil}}
            it 'returns eroor' do
                expect(call). to eq false
                expect(form.errors.full_messages). to include("Password can't be blank")
            end
        end
    end
end