resource "oci_media_services_stream_distribution_channel" "media_services_stream_distribution_channels" {
  for_each = var.media_services_stream_distribution_channels

  compartment_id   = each.value.compartment_id
  display_name     = each.value.display_name
  defined_tags     = each.value.defined_tags
  freeform_tags    = each.value.freeform_tags
  is_lock_override = each.value.is_lock_override

  dynamic "locks" {
    for_each = each.value.locks != null ? each.value.locks : []
    content {
      compartment_id      = locks.value.compartment_id
      message             = locks.value.message
      related_resource_id = locks.value.related_resource_id
      time_created        = locks.value.time_created
      type                = locks.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

