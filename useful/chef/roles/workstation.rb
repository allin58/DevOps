name "workstation"

default_attributes( 

  :java => { 
    :install_flavor => 'oracle',
    :jdk_version => '8',
    :accept_license_agreement => true,
    :oracle => { "accept_oracle_download_terms" => true } 
  }

)

run_list(
  "recipe[java]"

)