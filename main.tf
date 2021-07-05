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

#data "statuspage_components" "default" {
#    page_id = "wvy1y3msjr06"
#    filter {
#        name = "name"
#        values = [ "value_1", "value_2" ]
#    }
#}

#output "statuspage_components" {
#	value = jsonencode(data.statuspage_components.default.components)
#}

#data "statuspage_component_groups" "default" {
#    page_id = "wvy1y3msjr06"
#    filter {
#        name = "name"
#        values = [ "value_1", "value_2" ]
#    }
#}

#output "statuspage_component_groups" {
#	value = jsonencode(data.statuspage_component_groups.default.component_groups)
#}

resource "statuspage_component" "my_component" {
  page_id     = "wvy1y3msjr06"
  name        = "Sandbox Miklos 2"
  description = "see TCOE-593 for more info"
  status      = "operational"
  lifecycle {
      ignore_changes = [
          status
      ]
  }
}

resource "statuspage_incident" "my_incident" {
  page_id     = "wvy1y3msjr06"
  name    = "Test incident name 6"
  impact_override = "none"
  status = "investigating"
  body   = "We are currently investigating the issue."
  component {
    id = statuspage_component.my_component.id
    name = statuspage_component.my_component.name
    status = "under_maintenance"
  }
}
