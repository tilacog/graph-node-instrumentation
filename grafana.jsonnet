local template = "sum(increase(deployment_sync_secs{deployment=\"[[deployment]]\",section=\"%s\"}[1y]))";
local queries = [
  "apply_entity_modifications",
  "apply_entity_modifications_insert",
  "apply_entity_modifications_update",
  "as_modifications",
  "chain_head",
  "check_interface_entity_uniqueness",
  "delete_modification_clamp_range_query",
  "entity_cache_evict",
  "fetch_blocks",
  "host_export_ethereum_call",
  "host_export_ipfs_cat",
  "host_export_ipfs_map",
  "host_export_other",
  "host_export_store_get",
  "host_export_store_set",
  "insert_modification_insert_query",
  "module_init",
  "run_handler",
  "scan_blocks",
  "store_get_asc_new",
  "transact_block",
  "unknown",
  "update_modification_clamp_range_query",
  "update_modification_insert_query",
  "update_proof_of_indexing",
];

{
  "annotations": {
    "list": [
      {
	"builtIn": 1,
	"datasource": "-- Grafana --",
	"enable": true,
	"hide": true,
	"iconColor": "rgba(0, 211, 255, 1)",
	"name": "Annotations & Alerts",
	"type": "dashboard"
      }
    ]
  },
  "description": "Analog to 'subgraph_metrics (old labels)' with new metric labels",
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "id": 132,
  "iteration": 1615566829461,
  "links": [ ],
  "panels": [
    {
      "cacheTimeout": null,
      "columns": [ ],
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "fontSize": "100%",
      "gridPos": {
	"h": 11,
	"w": 12,
	"x": 0,
	"y": 0
      },
      "id": 18,
      "links": [ ],
      "pageSize": null,
      "showHeader": true,
      "sort": {
	"col": 2,
	"desc": true
      },
      "styles": [
	{
	  "alias": "Time",
	  "align": "auto",
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "pattern": "Time",
	  "type": "hidden"
	},
	{
	  "alias": "Time spent",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "decimals": 2,
	  "mappingType": 1,
	  "pattern": "Value",
	  "thresholds": [ ],
	  "type": "number",
	  "unit": "s"
	},
	{
	  "alias": "Section",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "decimals": 2,
	  "mappingType": 1,
	  "pattern": "Metric",
	  "thresholds": [ ],
	  "type": "string",
	  "unit": "short"
	}
      ],

      targets: [
	{
	  "expr": "sum(increase(deployment_sync_secs{deployment=\"[[deployment]]\"}[1y]))",
	  "instant": true,
	  "interval": "",
	  "legendFormat": "total",
	  "refId": "Q0"
	}] + [
	# jsonnet begins here
	{
	  "expr": std.format(template, queries[idx-1]),
	  "instant": true,
	  "interval": "",
	  "legendFormat": queries[idx-1],
	  "refId": "Q" + idx,
	} for idx in std.range(1, std.length(queries))
      ],

      "timeFrom": null,
      "timeShift": null,
      "title": "Time spent while indexing",
      "transform": "timeseries_to_rows",
      "type": "table-old"
    },
    {
      "aliasColors": { },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 7,
      "fillGradient": 0,
      "gridPos": {
	"h": 9,
	"w": 12,
	"x": 12,
	"y": 0
      },
      "hiddenSeries": false,
      "id": 2,
      "legend": {
	"avg": true,
	"current": false,
	"max": true,
	"min": false,
	"show": true,
	"total": false,
	"values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
	"alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
	{
	  "alias": "/eth_getLogs/",
	  "color": "#5794F2"
	}
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_eth_rpc_request_duration{deployment=\"[[deployment]]\"}[1m])) by (method) * 1000",
	  "interval": "",
	  "legendFormat": "{{method}}",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Eth Rpc Request Duration",
      "tooltip": {
	"shared": true,
	"sort": 0,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "format": "short",
	  "label": "ms",
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    },
    {
      "aliasColors": { },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
	"h": 4,
	"w": 12,
	"x": 12,
	"y": 9
      },
      "hiddenSeries": false,
      "id": 12,
      "legend": {
	"avg": false,
	"current": true,
	"max": false,
	"min": false,
	"show": true,
	"total": false,
	"values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
	"alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
	{
	  "alias": "/value/",
	  "color": "#FADE2A"
	},
	{
	  "alias": "number of reverted blocks",
	  "yaxis": 1
	},
	{
	  "alias": "last reverted block number",
	  "yaxis": 2
	}
      ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "irate(deployment_reverted_blocks{deployment=\"[[deployment]]\"}[1m])",
	  "hide": false,
	  "instant": false,
	  "interval": "",
	  "intervalFactor": 1,
	  "legendFormat": "number of reverted blocks",
	  "refId": "A"
	},
	{
	  "expr": "deployment_reverted_blocks{deployment=\"[[deployment]]\"}",
	  "hide": false,
	  "instant": false,
	  "interval": "",
	  "legendFormat": "last reverted block number",
	  "refId": "B"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Last Reverted Block Number",
      "tooltip": {
	"shared": true,
	"sort": 0,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "decimals": null,
	  "format": "none",
	  "label": "",
	  "logBase": 1,
	  "max": null,
	  "min": "0",
	  "show": true
	},
	{
	  "format": "none",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": "0",
	  "show": true
	}
      ],
      "yaxis": {
	"align": true,
	"alignLevel": null
      }
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorPostfix": false,
      "colorValue": false,
      "colors": [
	"#299c46",
	"rgba(237, 129, 40, 0.89)",
	"#d44a3a"
      ],
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "format": "s",
      "gauge": {
	"maxValue": 100,
	"minValue": 0,
	"show": false,
	"thresholdLabels": false,
	"thresholdMarkers": true
      },
      "gridPos": {
	"h": 2,
	"w": 12,
	"x": 0,
	"y": 11
      },
      "id": 20,
      "interval": null,
      "links": [ ],
      "mappingType": 1,
      "mappingTypes": [
	{
	  "name": "value to text",
	  "value": 1
	},
	{
	  "name": "range to text",
	  "value": 2
	}
      ],
      "maxDataPoints": 100,
      "nullPointMode": "connected",
      "nullText": null,
      "pluginVersion": "6.4.3",
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
	{
	  "from": "null",
	  "text": "N/A",
	  "to": "null"
	}
      ],
      "sparkline": {
	"fillColor": "rgba(31, 118, 189, 0.18)",
	"full": false,
	"lineColor": "rgb(31, 120, 193)",
	"show": false,
	"ymax": null,
	"ymin": null
      },
      "tableColumn": "Value",
      "targets": [
	{
	  "expr": "deployment_get_entity_conn_secs{deployment=\"subgraphs\"}",
	  "format": "table",
	  "instant": true,
	  "interval": "",
	  "legendFormat": "",
	  "refId": "A"
	}
      ],
      "thresholds": "",
      "timeFrom": null,
      "timeShift": null,
      "title": "Total time waiting for DB connection",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
	{
	  "op": "=",
	  "text": "N/A",
	  "value": "null"
	}
      ],
      "valueName": "current"
    },
    {
      "datasource": null,
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 2,
	"w": 24,
	"x": 0,
	"y": 13
      },
      "id": 33,
      "options": {
	"content": "<br/> \n<center> \n  <h1>Block Processing / Handler Execution</h1> \n</center>",
	"mode": "html"
      },
      "pluginVersion": "7.4.4",
      "timeFrom": null,
      "timeShift": null,
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "aliasColors": { },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 7,
      "fillGradient": 0,
      "gridPos": {
	"h": 7,
	"w": 24,
	"x": 0,
	"y": 15
      },
      "hiddenSeries": false,
      "id": 34,
      "legend": {
	"alignAsTable": false,
	"avg": true,
	"current": false,
	"max": true,
	"min": false,
	"show": true,
	"total": false,
	"values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
	"alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [
	{
	  "alias": "/value/",
	  "color": "#FFB357"
	},
	{ }
      ],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_block_processing_duration_sum{deployment=\"[[deployment]]\"}[1m]))",
	  "format": "time_series",
	  "instant": false,
	  "interval": "",
	  "legendFormat": " ",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Blocks Processed",
      "tooltip": {
	"shared": true,
	"sort": 0,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "format": "short",
	  "label": "",
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    },
    {
      "cards": {
	"cardPadding": null,
	"cardRound": null
      },
      "color": {
	"cardColor": "#7C2EA3",
	"colorScale": "sqrt",
	"colorScheme": "interpolatePlasma",
	"exponent": 0.5,
	"mode": "spectrum"
      },
      "dataFormat": "tsbuckets",
      "datasource": "Prometheus",
      "description": "",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 6,
	"w": 24,
	"x": 0,
	"y": 22
      },
      "heatmap": { },
      "hideZeroBuckets": true,
      "highlightCards": true,
      "id": 4,
      "legend": {
	"show": true
      },
      "reverseYBuckets": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_block_processing_duration_bucket{deployment=\"[[deployment]]\"}[1m])) by (le)",
	  "format": "heatmap",
	  "interval": "",
	  "legendFormat": "{{le}}",
	  "refId": "A"
	}
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Block Processing Duration",
      "tooltip": {
	"show": true,
	"showHistogram": false
      },
      "type": "heatmap",
      "xAxis": {
	"show": true
      },
      "xBucketNumber": null,
      "xBucketSize": null,
      "yAxis": {
	"decimals": null,
	"format": "short",
	"logBase": 1,
	"max": null,
	"min": null,
	"show": true,
	"splitFactor": null
      },
      "yBucketBound": "auto",
      "yBucketNumber": null,
      "yBucketSize": null
    },
    {
      "cards": {
	"cardPadding": null,
	"cardRound": null
      },
      "color": {
	"cardColor": "#1250B0",
	"colorScale": "linear",
	"colorScheme": "interpolatePlasma",
	"exponent": 0.5,
	"mode": "spectrum"
      },
      "dataFormat": "tsbuckets",
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 6,
	"w": 24,
	"x": 0,
	"y": 28
      },
      "heatmap": { },
      "hideZeroBuckets": true,
      "highlightCards": true,
      "id": 16,
      "legend": {
	"show": true
      },
      "pluginVersion": "6.5.1",
      "reverseYBuckets": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_transact_block_operations_duration_bucket{deployment=\"[[deployment]]\"}[1m])) by (le)",
	  "format": "heatmap",
	  "interval": "",
	  "legendFormat": "{{le}}",
	  "refId": "A"
	}
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Transact Block Ops Duration",
      "tooltip": {
	"show": true,
	"showHistogram": false
      },
      "type": "heatmap",
      "xAxis": {
	"show": true
      },
      "xBucketNumber": null,
      "xBucketSize": null,
      "yAxis": {
	"decimals": null,
	"format": "short",
	"logBase": 1,
	"max": null,
	"min": null,
	"show": true,
	"splitFactor": null
      },
      "yBucketBound": "lower",
      "yBucketNumber": null,
      "yBucketSize": null
    },
    {
      "cards": {
	"cardPadding": null,
	"cardRound": null
      },
      "color": {
	"cardColor": "#AD0317",
	"colorScale": "linear",
	"colorScheme": "interpolatePlasma",
	"exponent": 0.5,
	"mode": "spectrum"
      },
      "dataFormat": "tsbuckets",
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 6,
	"w": 24,
	"x": 0,
	"y": 34
      },
      "heatmap": { },
      "hideZeroBuckets": true,
      "highlightCards": true,
      "id": 14,
      "legend": {
	"show": true
      },
      "reverseYBuckets": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_host_fn_execution_time_bucket{deployment=\"[[deployment]]\",host_fn_name=\"[[host_fn]]\"}[1m])) by (le)",
	  "format": "heatmap",
	  "interval": "",
	  "legendFormat": "{{le}}",
	  "refId": "A"
	}
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "[[host_fn]] Execution Time",
      "tooltip": {
	"show": true,
	"showHistogram": false
      },
      "type": "heatmap",
      "xAxis": {
	"show": true
      },
      "xBucketNumber": null,
      "xBucketSize": null,
      "yAxis": {
	"decimals": null,
	"format": "short",
	"logBase": 1,
	"max": null,
	"min": null,
	"show": true,
	"splitFactor": null
      },
      "yBucketBound": "auto",
      "yBucketNumber": null,
      "yBucketSize": null
    },
    {
      "aliasColors": { },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
	"h": 6,
	"w": 24,
	"x": 0,
	"y": 40
      },
      "hiddenSeries": false,
      "id": 62,
      "legend": {
	"avg": false,
	"current": false,
	"max": false,
	"min": false,
	"show": true,
	"total": false,
	"values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "percentage": true,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [ ],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_host_fn_execution_time_sum{deployment=\"[[deployment]]\"}[1m])) by (host_fn_name)",
	  "format": "time_series",
	  "interval": "",
	  "legendFormat": "{{host_fn_name}}",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Host Function Triggered",
      "tooltip": {
	"shared": true,
	"sort": 0,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    },
    {
      "cards": {
	"cardPadding": null,
	"cardRound": null
      },
      "color": {
	"cardColor": "#b4ff00",
	"colorScale": "sqrt",
	"colorScheme": "interpolatePlasma",
	"exponent": 0.5,
	"mode": "spectrum"
      },
      "dataFormat": "tsbuckets",
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 6,
	"w": 24,
	"x": 0,
	"y": 46
      },
      "heatmap": { },
      "hideZeroBuckets": true,
      "highlightCards": true,
      "id": 8,
      "legend": {
	"show": true
      },
      "reverseYBuckets": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_block_trigger_count_bucket{deployment=\"[[deployment]]\"}[1m])) by (le)",
	  "format": "heatmap",
	  "interval": "",
	  "legendFormat": "{{le}}",
	  "refId": "A"
	}
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Block Trigger Count",
      "tooltip": {
	"show": true,
	"showHistogram": false
      },
      "type": "heatmap",
      "xAxis": {
	"show": true
      },
      "xBucketNumber": null,
      "xBucketSize": null,
      "yAxis": {
	"decimals": null,
	"format": "short",
	"logBase": 1,
	"max": null,
	"min": null,
	"show": true,
	"splitFactor": null
      },
      "yBucketBound": "auto",
      "yBucketNumber": null,
      "yBucketSize": null
    },
    {
      "cards": {
	"cardPadding": null,
	"cardRound": null
      },
      "color": {
	"cardColor": "#CC9D00",
	"colorScale": "linear",
	"colorScheme": "interpolatePlasma",
	"exponent": 0.5,
	"mode": "spectrum"
      },
      "dataFormat": "tsbuckets",
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 6,
	"w": 24,
	"x": 0,
	"y": 52
      },
      "heatmap": { },
      "hideZeroBuckets": true,
      "highlightCards": true,
      "id": 35,
      "legend": {
	"show": true
      },
      "reverseYBuckets": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_handler_execution_time_bucket{deployment=\"[[deployment]]\",handler=\"[[handler]]\"}[5m])) by (le)",
	  "format": "heatmap",
	  "interval": "",
	  "legendFormat": "{{le}}",
	  "refId": "A"
	}
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "[[handler]] Execution Time",
      "tooltip": {
	"show": true,
	"showHistogram": false
      },
      "type": "heatmap",
      "xAxis": {
	"show": true
      },
      "xBucketNumber": null,
      "xBucketSize": null,
      "yAxis": {
	"decimals": null,
	"format": "short",
	"logBase": 1,
	"max": null,
	"min": null,
	"show": true,
	"splitFactor": null
      },
      "yBucketBound": "auto",
      "yBucketNumber": null,
      "yBucketSize": null
    },
    {
      "aliasColors": { },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 7,
      "fillGradient": 0,
      "gridPos": {
	"h": 6,
	"w": 24,
	"x": 0,
	"y": 58
      },
      "hiddenSeries": false,
      "id": 6,
      "legend": {
	"avg": false,
	"current": false,
	"max": false,
	"min": false,
	"show": true,
	"total": false,
	"values": false
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "percentage": true,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [ ],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "sum(increase(deployment_handler_execution_time_sum{deployment=\"[[deployment]]\"}[1m])) by (handler)",
	  "format": "time_series",
	  "interval": "",
	  "legendFormat": "{{handler}}",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Handler Triggered",
      "tooltip": {
	"shared": true,
	"sort": 2,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    },
    {
      "datasource": null,
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 2,
	"w": 12,
	"x": 0,
	"y": 64
      },
      "id": 32,
      "options": {
	"content": "</br>\n<center> \n  <h1>GraphQL Server</h1> \n</center>",
	"mode": "html"
      },
      "pluginVersion": "7.4.4",
      "timeFrom": null,
      "timeShift": null,
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "datasource": null,
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 2,
	"w": 12,
	"x": 12,
	"y": 64
      },
      "id": 31,
      "options": {
	"content": "<br/> \n<center> \n  <h1>Block Ingestor</h1> \n</center>",
	"mode": "html"
      },
      "pluginVersion": "7.4.4",
      "timeFrom": null,
      "timeShift": null,
      "title": "",
      "transparent": true,
      "type": "text"
    },
    {
      "cacheTimeout": null,
      "cards": {
	"cardPadding": null,
	"cardRound": null
      },
      "color": {
	"cardColor": "#b4ff00",
	"colorScale": "sqrt",
	"colorScheme": "interpolatePlasma",
	"exponent": 0.5,
	"mode": "spectrum"
      },
      "dataFormat": "tsbuckets",
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "gridPos": {
	"h": 9,
	"w": 8,
	"x": 0,
	"y": 66
      },
      "heatmap": { },
      "hideZeroBuckets": true,
      "highlightCards": true,
      "id": 29,
      "legend": {
	"show": false
      },
      "links": [ ],
      "pluginVersion": "6.5.1",
      "repeatDirection": "v",
      "reverseYBuckets": false,
      "targets": [
	{
	  "expr": "sum(increase(query_execution_time_bucket{deployment=\"[[deployment]]\"}[1m])) by (le)",
	  "format": "heatmap",
	  "instant": false,
	  "interval": "",
	  "intervalFactor": 1,
	  "legendFormat": "{{le}}",
	  "refId": "A"
	}
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Query Execution Time Histogram",
      "tooltip": {
	"show": true,
	"showHistogram": false
      },
      "type": "heatmap",
      "xAxis": {
	"show": true
      },
      "xBucketNumber": null,
      "xBucketSize": null,
      "yAxis": {
	"decimals": null,
	"format": "short",
	"logBase": 1,
	"max": null,
	"min": null,
	"show": true,
	"splitFactor": null
      },
      "yBucketBound": "auto",
      "yBucketNumber": null,
      "yBucketSize": null
    },
    {
      "aliasColors": { },
      "bars": true,
      "cacheTimeout": null,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
	"h": 9,
	"w": 4,
	"x": 8,
	"y": 66
      },
      "hiddenSeries": false,
      "id": 26,
      "legend": {
	"avg": false,
	"current": false,
	"max": false,
	"min": false,
	"show": false,
	"total": false,
	"values": false
      },
      "lines": false,
      "linewidth": 1,
      "links": [ ],
      "nullPointMode": "null",
      "percentage": false,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "repeat": "deployment",
      "repeatDirection": "v",
      "seriesOverrides": [ ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "sum(increase(query_execution_time_bucket{deployment=\"[[deployment]]\"}[1m])) by (le)",
	  "format": "heatmap",
	  "instant": false,
	  "interval": "",
	  "intervalFactor": 1,
	  "legendFormat": "{{le}}",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Query Execution Time Histogram ([[deployment]])",
      "tooltip": {
	"shared": false,
	"sort": 0,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "series",
	"name": null,
	"show": true,
	"values": [
	  "total"
	]
      },
      "yaxes": [
	{
	  "format": "locale",
	  "label": "",
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": false
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    },
    {
      "cacheTimeout": null,
      "columns": [ ],
      "datasource": "Prometheus",
      "description": "block_ingestor_panel",
      "fieldConfig": {
	"defaults": {
	  "custom": { }
	},
	"overrides": [ ]
      },
      "fontSize": "100%",
      "gridPos": {
	"h": 7,
	"w": 12,
	"x": 12,
	"y": 66
      },
      "id": 61,
      "links": [ ],
      "pageSize": null,
      "pluginVersion": "6.5.1",
      "repeatDirection": "v",
      "showHeader": true,
      "sort": {
	"col": null,
	"desc": false
      },
      "styles": [
	{
	  "alias": "Time",
	  "align": "auto",
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "pattern": "Time",
	  "type": "hidden"
	},
	{
	  "alias": "",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "decimals": 2,
	  "mappingType": 1,
	  "pattern": "/__name__/",
	  "thresholds": [ ],
	  "type": "hidden",
	  "unit": "short"
	},
	{
	  "alias": "",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "decimals": 2,
	  "mappingType": 1,
	  "pattern": "/job/",
	  "thresholds": [ ],
	  "type": "hidden",
	  "unit": "short"
	},
	{
	  "alias": "",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "decimals": 2,
	  "mappingType": 1,
	  "pattern": "/kubernetes_pod_name/",
	  "thresholds": [ ],
	  "type": "hidden",
	  "unit": "short"
	},
	{
	  "alias": "",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "decimals": 2,
	  "mappingType": 1,
	  "pattern": "/instance/",
	  "thresholds": [ ],
	  "type": "hidden",
	  "unit": "short"
	},
	{
	  "alias": "",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "decimals": 2,
	  "mappingType": 1,
	  "pattern": "/network/",
	  "preserveFormat": false,
	  "sanitize": false,
	  "thresholds": [ ],
	  "type": "string",
	  "unit": "short"
	},
	{
	  "alias": "Latest Block",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "dateFormat": "YYYY-MM-DD HH:mm:ss",
	  "decimals": 2,
	  "mappingType": 1,
	  "pattern": "Value",
	  "thresholds": [ ],
	  "type": "number",
	  "unit": "locale"
	},
	{
	  "alias": "",
	  "align": "auto",
	  "colorMode": null,
	  "colors": [
	    "rgba(245, 54, 54, 0.9)",
	    "rgba(237, 129, 40, 0.89)",
	    "rgba(50, 172, 45, 0.97)"
	  ],
	  "decimals": 2,
	  "pattern": "/.*/",
	  "thresholds": [ ],
	  "type": "number",
	  "unit": "locale"
	}
      ],
      "targets": [
	{
	  "expr": "ethereum_chain_head_number{kubernetes_pod_name=\"index-node-block-ingestor-0\"}",
	  "format": "table",
	  "instant": true,
	  "interval": "",
	  "legendFormat": "{{network}}",
	  "refId": "A"
	}
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "",
      "transform": "table",
      "type": "table-old"
    },
    {
      "aliasColors": { },
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "decimals": 1,
      "description": "block_ingestor_panel",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 0,
      "fillGradient": 0,
      "gridPos": {
	"h": 16,
	"w": 12,
	"x": 12,
	"y": 73
      },
      "hiddenSeries": false,
      "id": 10,
      "legend": {
	"alignAsTable": true,
	"avg": true,
	"current": false,
	"hideEmpty": false,
	"hideZero": false,
	"max": false,
	"min": false,
	"rightSide": false,
	"show": true,
	"total": false,
	"values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "percentage": false,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [ ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "sum(increase(ethereum_chain_head_number{kubernetes_pod_name=\"index-node-block-ingestor-0\"}[1m])) by (network)",
	  "instant": false,
	  "interval": "",
	  "legendFormat": "{{network}}",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Block Syncing Rate",
      "tooltip": {
	"shared": true,
	"sort": 0,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "format": "short",
	  "label": "",
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    },
    {
      "aliasColors": { },
      "bars": false,
      "cacheTimeout": null,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 8,
      "fillGradient": 0,
      "gridPos": {
	"h": 7,
	"w": 12,
	"x": 0,
	"y": 75
      },
      "hiddenSeries": false,
      "id": 36,
      "legend": {
	"alignAsTable": true,
	"avg": false,
	"current": false,
	"max": false,
	"min": false,
	"show": true,
	"sort": "total",
	"sortDesc": true,
	"total": true,
	"values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [ ],
      "nullPointMode": "connected",
      "percentage": false,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "repeatDirection": "v",
      "seriesOverrides": [ ],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "sum(increase(query_execution_time_count[1m])) by (deployment)",
	  "format": "time_series",
	  "instant": false,
	  "interval": "",
	  "intervalFactor": 1,
	  "legendFormat": "{{subgraph_deployment}}",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Queries  (All Subgraphs)",
      "tooltip": {
	"shared": true,
	"sort": 2,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "format": "locale",
	  "label": "",
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": false
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    },
    {
      "aliasColors": { },
      "bars": false,
      "cacheTimeout": null,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 0,
      "fillGradient": 0,
      "gridPos": {
	"h": 7,
	"w": 12,
	"x": 0,
	"y": 82
      },
      "hiddenSeries": false,
      "id": 27,
      "legend": {
	"alignAsTable": false,
	"avg": false,
	"current": false,
	"max": false,
	"min": false,
	"show": true,
	"sort": "avg",
	"sortDesc": true,
	"total": false,
	"values": false
      },
      "lines": true,
      "linewidth": 2,
      "links": [ ],
      "nullPointMode": "null",
      "percentage": false,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "repeatDirection": "v",
      "seriesOverrides": [ ],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "sum(rate(query_execution_time_count[1m])) by (deployment)",
	  "format": "time_series",
	  "instant": false,
	  "interval": "",
	  "intervalFactor": 1,
	  "legendFormat": "{{deployment}}",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Query Rate (All Subgraphs)",
      "tooltip": {
	"shared": true,
	"sort": 2,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "format": "locale",
	  "label": "Queries per minute",
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": false
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    },
    {
      "aliasColors": { },
      "bars": false,
      "cacheTimeout": null,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
	"defaults": {
	  "custom": { },
	  "links": [ ]
	},
	"overrides": [ ]
      },
      "fill": 7,
      "fillGradient": 0,
      "gridPos": {
	"h": 7,
	"w": 12,
	"x": 0,
	"y": 89
      },
      "hiddenSeries": false,
      "id": 41,
      "legend": {
	"alignAsTable": true,
	"avg": false,
	"current": false,
	"max": false,
	"min": false,
	"show": true,
	"sort": "total",
	"sortDesc": true,
	"total": false,
	"values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [ ],
      "nullPointMode": "connected",
      "percentage": false,
      "pluginVersion": "7.4.4",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "repeatDirection": "v",
      "seriesOverrides": [ ],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
	{
	  "expr": "increase(query_failed_execution_time_count[1m])",
	  "format": "time_series",
	  "instant": false,
	  "interval": "",
	  "intervalFactor": 1,
	  "legendFormat": "{{subgraph_deployment}}",
	  "refId": "A"
	}
      ],
      "thresholds": [ ],
      "timeFrom": null,
      "timeRegions": [ ],
      "timeShift": null,
      "title": "Failed Queries  (All Subgraphs)",
      "tooltip": {
	"shared": true,
	"sort": 2,
	"value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
	"buckets": null,
	"mode": "time",
	"name": null,
	"show": true,
	"values": [ ]
      },
      "yaxes": [
	{
	  "format": "locale",
	  "label": "",
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": true
	},
	{
	  "format": "short",
	  "label": null,
	  "logBase": 1,
	  "max": null,
	  "min": null,
	  "show": false
	}
      ],
      "yaxis": {
	"align": false,
	"alignLevel": null
      }
    }
  ],
  "refresh": false,
  "schemaVersion": 27,
  "style": "dark",
  "tags": [ ],
  "templating": {
    "list": [
      {
	"allValue": null,
	"current": {
	  "selected": false,
	  "text": "QmSVaPCRxDxZbQUsDAKmWWe7s8mfEtbJvL81nbpUMQoZnB",
	  "value": "QmSVaPCRxDxZbQUsDAKmWWe7s8mfEtbJvL81nbpUMQoZnB"
	},
	"datasource": "Postgres",
	"definition": "select subgraph from deployment_schemas where id > 0",
	"description": null,
	"error": null,
	"hide": 0,
	"includeAll": false,
	"label": null,
	"multi": false,
	"name": "deployment",
	"options": [ ],
	"query": "select subgraph from deployment_schemas where id > 0",
	"refresh": 1,
	"regex": "",
	"skipUrlSync": false,
	"sort": 5,
	"tagValuesQuery": "",
	"tags": [ ],
	"tagsQuery": "",
	"type": "query",
	"useTags": false
      },
      {
	"allValue": null,
	"current": {
	  "selected": false,
	  "text": "handleBurn",
	  "value": "handleBurn"
	},
	"datasource": "Prometheus",
	"definition": "label_values(deployment_handler_execution_time_bucket{deployment=\"[[deployment]]\"}, handler)",
	"description": null,
	"error": null,
	"hide": 0,
	"includeAll": false,
	"label": null,
	"multi": false,
	"name": "handler",
	"options": [ ],
	"query": {
	  "query": "label_values(deployment_handler_execution_time_bucket{deployment=\"[[deployment]]\"}, handler)",
	  "refId": "Prometheus-handler-Variable-Query"
	},
	"refresh": 2,
	"regex": "",
	"skipUrlSync": false,
	"sort": 5,
	"tagValuesQuery": "",
	"tags": [ ],
	"tagsQuery": "",
	"type": "query",
	"useTags": false
      },
      {
	"allValue": null,
	"current": {
	  "selected": false,
	  "text": "store_get",
	  "value": "store_get"
	},
	"datasource": "Prometheus",
	"definition": "label_values(deployment_host_fn_execution_time_bucket{deployment=\"[[deployment]]\"}, host_fn_name)",
	"description": null,
	"error": null,
	"hide": 0,
	"includeAll": false,
	"label": null,
	"multi": false,
	"name": "host_fn",
	"options": [ ],
	"query": {
	  "query": "label_values(deployment_host_fn_execution_time_bucket{deployment=\"[[deployment]]\"}, host_fn_name)",
	  "refId": "Prometheus-host_fn-Variable-Query"
	},
	"refresh": 1,
	"regex": "",
	"skipUrlSync": false,
	"sort": 5,
	"tagValuesQuery": "",
	"tags": [ ],
	"tagsQuery": "",
	"type": "query",
	"useTags": false
      },
      {
	"allValue": null,
	"current": {
	  "selected": true,
	  "text": [
	    "All"
	  ],
	  "value": [
	    "$__all"
	  ]
	},
	"datasource": "Prometheus",
	"definition": "ethereum_chain_head_number",
	"description": null,
	"error": null,
	"hide": 2,
	"includeAll": true,
	"label": null,
	"multi": true,
	"name": "network",
	"options": [ ],
	"query": {
	  "query": "ethereum_chain_head_number",
	  "refId": "Prometheus-network-Variable-Query"
	},
	"refresh": 1,
	"regex": "/.*network=\"([^\"]*).*/",
	"skipUrlSync": false,
	"sort": 5,
	"tagValuesQuery": "",
	"tags": [ ],
	"tagsQuery": "",
	"type": "query",
	"useTags": false
      }
    ]
  },
  "time": {
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ]
  },
  "timezone": "",
  "title": "Subgraph Indexing Metrics",
  "uid": "F6JZHNSMk",
  "version": 3
}
