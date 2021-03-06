RailsAdmin.config do |config|

  ### Popular gems integration

  config.authenticate_with do
    config.authenticate_with do
      warden.authenticate! scope: :member
    end
    config.current_user_method(&:current_member)
  end

  config.excluded_models = ['ActiveStorage::Blob', 'ActiveStorage::Attachment']

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Member' do
    list do
      field :id
      field :first_name
      field :last_name
      field :email
      field :membership_status
      field :membership_number
      field :access
      field :created_at
    end

    edit do
      field :first_name
      field :last_name
      field :email
      field :membership_status
      field :membership_number
      field :access
      field :password
    end
  end

end
