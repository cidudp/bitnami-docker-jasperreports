#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
  nami_initialize tomcat jasperreports
  echo tbeller.usejndi=false > /opt/bitnami/jasperreports/WEB-INF/classes/resfactory.properties
  info "Starting jasperreports... "
fi

exec tini -- "$@"
