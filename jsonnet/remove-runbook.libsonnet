local utils = import 'github.com/kubernetes-monitoring/kubernetes-mixin/lib/utils.libsonnet';

{
  prometheusAlerts+::
    local removeRunbookURL(rule) = rule {
      [if 'alert' in rule then 'annotations']+: {
        runbook_url:: super.runbook_url,
      },
    };
    utils.mapRuleGroups(removeRunbookURL),
}
