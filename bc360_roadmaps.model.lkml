connection: "bc360_main"

include: "//bc360_admin/bc360_triggers.lkml"
# include: "//bc360_admin/*.view.lkml"
include: "//bc360_clients/*.view.lkml"
include: "//bc360_services/*.view.lkml"
include: "//bc360_campaigns/*.view.lkml"
# include: "//bc360_users/*.view.lkml"

include: "*.view.lkml"

label: "BC360 - All Clients"

explore: mx_roadmap {
  label: "BC360 - Client Roadmaps"

  hidden: no

#  join: arch_campaigns_admin {
#    type: inner
#    relationship: many_to_one
#    sql_on: ${mx_roadmap.service_line_code} = ${arch_campaigns_admin.service_line_code};;
#  }
#
#  join: arch_clients_admin {
#    type: inner
#    relationship: many_to_one
#    sql_on: ${arch_campaigns_admin.organization_id} = ${arch_clients_admin.organization_id} ;;
#  }
}
