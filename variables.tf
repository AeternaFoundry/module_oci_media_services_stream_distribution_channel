variable "media_services_stream_distribution_channels" {
  description = <<EOT
Map of media_services_stream_distribution_channels, attributes below
Required:
    - compartment_id
    - display_name
Optional:
    - defined_tags
    - freeform_tags
    - is_lock_override
    - locks (block):
        - compartment_id (required)
        - message (optional)
        - related_resource_id (optional)
        - time_created (optional)
        - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id   = string
    display_name     = string
    defined_tags     = optional(map(string))
    freeform_tags    = optional(map(string))
    is_lock_override = optional(bool)
    locks = optional(list(object({
      compartment_id      = string
      message             = optional(string)
      related_resource_id = optional(string)
      time_created        = optional(string)
      type                = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

