ad_library {
    Procedures for registering implementations for the
    dotlrn imsld package. 
    
    @creation-date 2005-09-26
    @author eperez@it.uc3m.es
    @cvs-id $Id$
}

namespace eval dotlrn_imsld {}

ad_proc -public dotlrn_imsld::install {} {
    dotLRN IMS LD package install proc
} {
    register_portal_datasource_impl
}

ad_proc -public dotlrn_imsld::uninstall {} {
    dotLRN IMS LD package uninstall proc
} {
    unregister_portal_datasource_impl
}

ad_proc -public dotlrn_imsld::register_portal_datasource_impl {} {
    Register the service contract implementation for the dotlrn_applet service contract
} {
    set spec {
        name "dotlrn_imsld"
	contract_name "dotlrn_applet"
	owner "dotlrn-imsld"
        aliases {
	    GetPrettyName dotlrn_imsld::get_pretty_name
	    AddApplet dotlrn_imsld::add_applet
	    RemoveApplet dotlrn_imsld::remove_applet
	    AddAppletToCommunity dotlrn_imsld::add_applet_to_community
	    RemoveAppletFromCommunity dotlrn_imsld::remove_applet_from_community
	    AddUser dotlrn_imsld::add_user
	    RemoveUser dotlrn_imsld::remove_user
	    AddUserToCommunity dotlrn_imsld::add_user_to_community
	    RemoveUserFromCommunity dotlrn_imsld::remove_user_from_community
	    AddPortlet dotlrn_imsld::add_portlet
	    RemovePortlet dotlrn_imsld::remove_portlet
	    Clone dotlrn_imsld::clone
	    ChangeEventHandler dotlrn_imsld::change_event_handler
        }
    }
    
    acs_sc::impl::new_from_spec -spec $spec
}

ad_proc -public dotlrn_imsld::unregister_portal_datasource_impl {} {
    Unregister service contract implementations
} {
    acs_sc::impl::delete \
        -contract_name "dotlrn_applet" \
        -impl_name "dotlrn_imsld"
}

