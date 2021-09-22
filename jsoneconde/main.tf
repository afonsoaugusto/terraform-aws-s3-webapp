
output "json" {
  value = jsonencode({ rules = [{ filters = [], object-locator = { schema-name = "accounts", table-name = "%" }, rule-action = "include", rule-id = "1", rule-name = "1", rule-type = "selection" }, ] })
}

resource "local_file" "json_mappings" {
  filename = "${path.module}/mappings.json"
  content = jsonencode(
    {
      rules = [
        {
          filters = []
          object-locator = {
            schema-name = "accounts"
            table-name  = "%"
          }
          rule-action = "include"
          rule-id     = "1"
          rule-name   = "1"
          rule-type   = "selection"
        },
      ]
    }
  )
}

resource "local_file" "replication_task_settings" {
  filename = "${path.module}/replication_task_settings.json"
  content = jsonencode({
    "Logging" : {
      "EnableLogging" : false,
      "LogComponents" : [
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "TRANSFORMATION"
        },
        {
          "Severity" : "LOGGER_SEVERITY_INFO",
          "Id" : "SOURCE_UNLOAD"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "IO"
        },
        {
          "Severity" : "LOGGER_SEVERITY_INFO",
          "Id" : "TARGET_LOAD"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "PERFORMANCE"
        },
        {
          "Severity" : "LOGGER_SEVERITY_INFO",
          "Id" : "SOURCE_CAPTURE"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "SORTER"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "REST_SERVER"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "VALIDATOR_EXT"
        },
        {
          "Severity" : "LOGGER_SEVERITY_INFO",
          "Id" : "TARGET_APPLY"
        },
        {
          "Severity" : "LOGGER_SEVERITY_INFO",
          "Id" : "TASK_MANAGER"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "TABLES_MANAGER"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "METADATA_MANAGER"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "FILE_FACTORY"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "COMMON"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "ADDONS"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "DATA_STRUCTURE"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "COMMUNICATION"
        },
        {
          "Severity" : "LOGGER_SEVERITY_DEFAULT",
          "Id" : "FILE_TRANSFER"
        }
      ]
    },
    "StreamBufferSettings" : {
      "StreamBufferCount" : 3,
      "CtrlStreamBufferSizeInMB" : 5,
      "StreamBufferSizeInMB" : 8
    },
    "ErrorBehavior" : {
      "FailOnNoTablesCaptured" : true,
      "ApplyErrorUpdatePolicy" : "LOG_ERROR",
      "FailOnTransactionConsistencyBreached" : false,
      "RecoverableErrorThrottlingMax" : 1800,
      "DataErrorEscalationPolicy" : "SUSPEND_TABLE",
      "ApplyErrorEscalationCount" : 0,
      "RecoverableErrorStopRetryAfterThrottlingMax" : true,
      "RecoverableErrorThrottling" : true,
      "ApplyErrorFailOnTruncationDdl" : false,
      "DataTruncationErrorPolicy" : "LOG_ERROR",
      "ApplyErrorInsertPolicy" : "LOG_ERROR",
      "ApplyErrorEscalationPolicy" : "LOG_ERROR",
      "RecoverableErrorCount" : -1,
      "DataErrorEscalationCount" : 0,
      "TableErrorEscalationPolicy" : "STOP_TASK",
      "RecoverableErrorInterval" : 5,
      "ApplyErrorDeletePolicy" : "IGNORE_RECORD",
      "TableErrorEscalationCount" : 0,
      "FullLoadIgnoreConflicts" : true,
      "DataErrorPolicy" : "LOG_ERROR",
      "TableErrorPolicy" : "SUSPEND_TABLE"
    },
    "FullLoadSettings" : {
      "CommitRate" : 10000,
      "StopTaskCachedChangesApplied" : false,
      "StopTaskCachedChangesNotApplied" : false,
      "MaxFullLoadSubTasks" : 8,
      "TransactionConsistencyTimeout" : 600,
      "CreatePkAfterFullLoad" : false,
      "TargetTablePrepMode" : "DROP_AND_CREATE"
    },
    "TargetMetadata" : {
      "ParallelApplyBufferSize" : 0,
      "ParallelApplyQueuesPerThread" : 0,
      "ParallelApplyThreads" : 0,
      "TargetSchema" : "",
      "InlineLobMaxSize" : 0,
      "ParallelLoadQueuesPerThread" : 0,
      "SupportLobs" : true,
      "LobChunkSize" : 64,
      "TaskRecoveryTableEnabled" : false,
      "ParallelLoadThreads" : 0,
      "LobMaxSize" : 32,
      "BatchApplyEnabled" : false,
      "FullLobMode" : false,
      "LimitedSizeLobMode" : true,
      "LoadMaxFileSize" : 0,
      "ParallelLoadBufferSize" : 0
    },
    "BeforeImageSettings" : null,
    "ControlTablesSettings" : {
      "historyTimeslotInMinutes" : 5,
      "HistoryTimeslotInMinutes" : 5,
      "StatusTableEnabled" : false,
      "SuspendedTablesTableEnabled" : false,
      "HistoryTableEnabled" : false,
      "ControlSchema" : "",
      "FullLoadExceptionTableEnabled" : false
    },
    "LoopbackPreventionSettings" : null,
    "CharacterSetSettings" : null,
    "FailTaskWhenCleanTaskResourceFailed" : false,
    "ChangeProcessingTuning" : {
      "StatementCacheSize" : 50,
      "CommitTimeout" : 1,
      "BatchApplyPreserveTransaction" : true,
      "BatchApplyTimeoutMin" : 1,
      "BatchSplitSize" : 0,
      "BatchApplyTimeoutMax" : 30,
      "MinTransactionSize" : 1000,
      "MemoryKeepTime" : 60,
      "BatchApplyMemoryLimit" : 500,
      "MemoryLimitTotal" : 1024
    },
    "ChangeProcessingDdlHandlingPolicy" : {
      "HandleSourceTableDropped" : true,
      "HandleSourceTableTruncated" : true,
      "HandleSourceTableAltered" : true
    },
    "PostProcessingRules" : null
  })
}



data "template_file" "table_mappings_accounts" {
  template = file("${path.module}/mp.json.tpl")
  vars = {
    schema_name = "accounts"
  }
}

output "name" {
  value = data.template_file.table_mappings_accounts.rendered
}
