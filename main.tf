terraform {
  required_providers {
    statuspage = {
      source  = "sbecker59/statuspage"
    }
  }
}

provider "statuspage" {
  api_key = "a4f8fd27-2eed-4c71-b101-9580c56bcd18"
}

data "statuspage_components" "default" {

    page_id = local.page_id

    filter {
        name = "name"
        values = [ "value_1", "value_2" ]
    }
}

output "statuspage_components" {
	value = jsonencode(data.statuspage_components.default.body)[0]
}

#resource "statuspage_component" "my_component" {
#  page_id     = "029l93xg1bxd"
#  name        = "Mikloska homokozoja 6"
#  description = "see TCOE-593 for more info"
#  status      = "operational"
#
#  lifecycle {
#      ignore_changes = [
#          status
#      ]
#  }
#}

#resource "statuspage_incident" "my_incident" {
#  page_id     = "029l93xg1bxd"
#
#  name    = "Test incident name 5"
#  impact_override = "none"
#  status = "investigating"
#  body   = "We are currently investigating the issue."

#  component {
#    id = statuspage_component.my_component.id
#    name = statuspage_component.my_component.name
#    status = "under_maintenance"
#  }
#
#  component {
#    id = statuspage_component.my_component_2.id
#    name = statuspage_component.my_component_2.name
#    status = "under_maintenance"
#  }

}
