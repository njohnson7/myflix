# spec/features/user_interacts_with_queue_spec.rb

feature 'User interacts with the queue' do
  scenario 'user adds and reorders videos in the queue'  do
    comedies   = Fabricate :category
    monk       = Fabricate :video, title: 'Monk'
    south_park = Fabricate :video, title: 'South Park'
    futurama   = Fabricate :video, title: 'Futurama'

    sign_in
      ;require'pry';binding.pry;
    find("a[href='/videos/#{monk.id}']").click
    page.should have_content monk.title
  end
end
