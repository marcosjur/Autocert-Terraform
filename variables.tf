variable "AUTOCERT_TOKEN_EMAIL" {
  type        = string
  description = "This value is the token used to login in gmail smpt server, used to send the e-mails"
}

variable "AUTOCERT_EMAIL_FROM" {
  type        = string
  description = "Sender e-mail"
}

variable "AUTOCERT_EMAIL_SUBJECT" {
  type        = string
  description = "Subject of a email"
}

variable "AUTOCERT_API_TOKEN" {
  type        = string
  description = "Security token to make the requests"
}
