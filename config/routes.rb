Rails.application.routes.draw do


  resources :student_attendances
  get 'news_events/calendar_colloquia'

  get 'news_events/for_the_media'

  get 'news_events/announcements'

  get 'offices_services/academic_programs'

  get 'offices_services/human_resourse'

  get 'offices_services/office_of_dean'

  get 'offices_services/exchange'

  get 'offices_services/contacts'

  get 'people/faculty_advisors'

  get 'people/alumni'

  get 'people/students_groups'

  get 'people/lecturers'

  get 'people/prospective_students'

  get 'faculty_research/graduate_research'

  get 'faculty_research/research_interests'

  get 'faculty_research/centers_initiatives'

  get 'faculty_research/undergraduate_research'

  get 'faculty_research/masterworks'

  get 'admission/master_degree'

  get 'admission/bachalor_degree'

  get 'admission/college'

  get 'admission/exchange_program'

  get 'admission/foreign_students'

  get 'admission/tution_fee'



  get 'academics/program_objectives'

  get 'academics/undergradute_program'

  get 'academics/graduate_program'

  get 'academics/courses'

  get 'academics/calendar'

  get 'academics/undergraduate_program'

  devise_for :users, :path => 'users'


  namespace :v1 do
    # get 'api/getAllLanguages/:userId' => 'api#getAllLanguages'
    # post '/api/search'
    post '/api/createSubject'
    post '/api/createLanguage'
    post '/api/createEducation'
    post '/api/createWorkExperience'
    post '/api/createComputerSkill'
    post '/api/createProffesionalSkill'
    get '/api/getStudentId/:labId/:studentId' => 'api#getStudentId'

  end
# , :defaults => {:format => :json}
  resources :groups

  resources :users do
    resources :schedules

    # get 'languages/index'
    # resources :languages
    # get 'language/edit' => 'language#edit'
    # get 'language/destroy/:id' => 'language#delete'
    # resources :languages
    resources :skills
    resources :subjects
    resources :curriculums
    resources :user_languages
    resources :computer_skills
    resources :educations
    resources :proffesional_skills
    resources :work_experiences


    # post 'language/destroy'
    # post '/languages/update/:langId' => 'languages#update'
    get 'users/getPdf'
    get 'users/search'
    get 'ams_data/:id' => 'users#ams_data', as: :ams_data_path
    get 'users/profile'
    get 'user/student'
    get 'user/teacher'
    get 'user/admin'
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
