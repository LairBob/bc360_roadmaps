view: mx_roadmap {
  # sql_table_name: mx_roadmaps.roadmap_core_live ;;
  derived_table: {
    sql: SELECT
            ROW_NUMBER() OVER () row_index,
            client_id,
            service_line_code,
            month,
            budget
          FROM `bc360-main.mx_roadmaps.roadmap_core_live`
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

  measure: budget_sum {
    label: "$ Budget"
    type: sum
    value_format_name: usd_0
  }

  dimension: client_id {
    label: "Client ID"
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: month {
    label: "Month"
    type: date
    sql: ${TABLE}.month ;;
  }

  dimension_group: month_group {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month ;;
  }

  dimension: service_line_code {
    type: string
    sql: ${TABLE}.service_line_code ;;
  }


}
