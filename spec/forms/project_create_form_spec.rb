require 'rails_helper'

RSpec.describe ProjectCreateForm do
    let(:call) {form.save}
    let(:form) {described_class.new(params)}
    let(:params) {{user: user, name: name}}
    let(:user) {create(:user)}
    let(:name) { 'randomname' }

    context "input with valid params" do
        it "saves" do
            expect(call).to eq true
        end
    end

    context "input with invalid" do
        
        context "user presence" do
            let(:params) { {user: nil, name: name} }
            it "don't save" do
                expect(call).to eq false
            end
        end

        context "project name presence" do
            let(:params) { {user: user, name: nil} }
            it "don't save" do
                expect(call).to eq false
            end
        end
    
        context "project name uniqueness" do
            before {
               project = Project.create!(name: 'project')
               project.memberships.create(user_id: user.id, role: 20)
            }

            let(:params) { {user: user, name: 'project'} }
            it "don't save" do
                expect(call).to eq false
            end
        end
    end
end
