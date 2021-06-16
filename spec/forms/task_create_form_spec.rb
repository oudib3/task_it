require 'rails_helper'

RSpec.describe TaskCreateForm do

    let(:call) {form.save}
    let(:form) {described_class.new(params)}
    let(:params) {{project: project, title: title}}
    let(:title) {'title 1'}
    let(:project) {create(:project)}

    context "task with valid params" do
        it "saves" do
            expect(call).to eq true
        end
    end

    context "task with invalid" do
        context "presence of" do
            context "title" do
                let(:params) {{project: project, title: nil}}
                it "do not save" do
                    expect(call).to eq false
                end
            end
            context "project" do
                let(:params) {{project: nil, title: title}}
                it "do not save" do
                    expect(call).to eq false
                end
            end
        end

        context "uniqueness of title" do
            let(:params) {{project: project, title: 'same title'}}
            it "do not save" do
                project.tasks.create(title: 'same title')
                expect(call).to eq false
            end
        end
    end
end