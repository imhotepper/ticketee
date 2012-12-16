require 'spec_helper'


feature 'Creating Projects' do
  scenario 'can create a project' do
    
    project_name = "First Project"
    
    visit '/'
    click_link 'New Project'
    fill_in 'Name', :with => project_name
    fill_in 'Description' , :with => "First project description"
    click_button 'Create Project'
    page.should have_content("Project has been created")
    
    project = Project.find_by_name project_name
    page.current_url.should == project_url(project)
    
    title = "#{project_name} - Projects - Ticketee"
    find("title").should have_content(title )
    
  end
  
end
