view: mx_roadmap {
  # sql_table_name: mx_roadmaps.roadmap_core_live ;;
  derived_table: {
    sql: SELECT
            ROW_NUMBER() OVER () row_index,
            client_id,
            service_line_code,
            medium,
            month,
            budget
          FROM `bc360-main.mx_roadmaps.roadmap_core_base`
    ;;
  }

  dimension: row_index {
    type: string
    hidden: yes
    primary_key: yes
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
    type: sum
    value_format_name: usd_0
    sql: ${budget} ;;
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

  dimension: service_line_code {
    label: "Service Line Code"
    hidden: no
    type: string
    sql: ${TABLE}.service_line_code ;;
  }


}
