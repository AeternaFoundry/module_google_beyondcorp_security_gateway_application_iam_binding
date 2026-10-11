resource "google_beyondcorp_security_gateway_application_iam_binding" "beyondcorp_security_gateway_application_iam_bindings" {
  for_each = var.beyondcorp_security_gateway_application_iam_bindings

  application_id      = each.value.application_id
  members             = each.value.members
  role                = each.value.role
  security_gateway_id = each.value.security_gateway_id
  project             = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

