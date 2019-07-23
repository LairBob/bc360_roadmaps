view: mx_roadmap {

  derived_table: {
    sql: SELECT
            ROW_NUMBER() OVER () row_num,
            row_index,
            client_id,
            service,
            service_line_code,
            medium,
            month,
            budget
          FROM `bc360-main.mx_roadmaps.roadmap_core_live`;;
  }

  dimension: row_num {
    view_label: "Z - Metadata"
    label: "Row Number"
    type: number
    hidden: no
    primary_key: yes
    sql: ${TABLE}.row_num ;;
  }

  dimension: row_index {
    view_label: "Z - Metadata"
    label: "Row Index"
    description: "Refers to the _original_ row on Google Sheet"
    type: number
    hidden: no
    sql: ${TABLE}.row_index ;;
  }

  dimension: budget {
    hidden: yes
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: medium {
    label: "Medium"
    type: string
    sql: ${TABLE}.medium ;;
  }

  measure: budget_sum {
    label: "$ Budget"
    type: number
    value_format_name: usd_0
    sql: NULLIF(SUM(${budget}), 0) ;;
  }

  dimension: client_id {
    label: "Client ID"
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: timeframes {
    label: "Timeframes"
    hidden: no
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month ;;
  }

  dimension: service_label {
    label: "Roadmap Item"
    type: string
    sql: ${TABLE}.service ;;
    order_by_field: row_index
  }

  dimension: service_line_code {
    label: "Service Line Code"
    hidden: no
    type: string
    sql: ${TABLE}.service_line_code ;;
  }


}
