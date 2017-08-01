-- Converted by http://www.sqlines.com/online
START TRANSACTION;
SET standard_conforming_strings=off;
SET escape_string_warning=off;
SET CONSTRAINTS ALL DEFERRED;

CREATE SEQUENCE lh_chat_seq;
CREATE TABLE IF NOT EXISTS lh_chat (
	id int NOT NULL DEFAULT NEXTVAL ('lh_chat_seq'),
	nick varchar(50) NOT NULL,
	status int NOT NULL DEFAULT '0',
	status_sub int NOT NULL DEFAULT '0',
	status_sub_sub int NOT NULL DEFAULT '0',
	time int NOT NULL,
	user_id int NOT NULL,
	hash varchar(40) NOT NULL,
	referrer text NOT NULL,
	session_referrer text NOT NULL,
	chat_variables text NOT NULL,
	remarks text NOT NULL,
	ip varchar(100) NOT NULL,
	dep_id int NOT NULL,
	sender_user_id int NOT NULL,
	product_id int NOT NULL,
	usaccept int NOT NULL DEFAULT '0',
	user_status int NOT NULL DEFAULT '0',
	user_closed_ts int NOT NULL DEFAULT '0',
	support_informed int NOT NULL DEFAULT '0',
	unread_messages_informed int NOT NULL DEFAULT '0',
	reinform_timeout int NOT NULL DEFAULT '0',
	last_op_msg_time int NOT NULL DEFAULT '0',
	has_unread_op_messages int NOT NULL DEFAULT '0',
	unread_op_messages_informed int NOT NULL DEFAULT '0',
	email varchar(100) NOT NULL,
	country_code varchar(100) NOT NULL,
	country_name varchar(100) NOT NULL,
	unanswered_chat int NOT NULL,
	user_typing int NOT NULL,
	user_typing_txt varchar(50) NOT NULL,
	operator_typing int NOT NULL,
	operator_typing_id int NOT NULL,
	phone varchar(100) NOT NULL,
	has_unread_messages int NOT NULL,
	last_user_msg_time int NOT NULL,
	fbst smallint NOT NULL,
	online_user_id int NOT NULL,
	auto_responder_id int NOT NULL,
	last_msg_id int NOT NULL,
	lsync int NOT NULL,
	additional_data text NOT NULL,				  
	user_tz_identifier varchar(50) NOT NULL,
	lat varchar(10) NOT NULL,
	lon varchar(10) NOT NULL,
	city varchar(100) NOT NULL,
	operation text NOT NULL,
	operation_admin varchar(200) NOT NULL,
	status_sub_arg varchar(200) NOT NULL,
	uagent varchar(250) NOT NULL,
	chat_locale varchar(10) NOT NULL,
	chat_locale_to varchar(10) NOT NULL,
	mail_send int NOT NULL,
	screenshot_id int NOT NULL,
	wait_time int NOT NULL,
	chat_duration int NOT NULL,
	tslasign int NOT NULL,
	priority int NOT NULL,
	chat_initiator int NOT NULL,
	transfer_timeout_ts int NOT NULL,
	transfer_timeout_ac int NOT NULL,
	transfer_if_na int NOT NULL,
	na_cb_executed int NOT NULL,
	device_type int NOT NULL,
	nc_cb_executed smallint NOT NULL,
	PRIMARY KEY (id)
	);

CREATE INDEX status_user_id ON lh_chat (status,user_id);
CREATE INDEX user_id_sender_user_id ON lh_chat (user_id, sender_user_id);
CREATE INDEX unanswered_chat ON lh_chat (unanswered_chat);
CREATE INDEX sender_user_id ON lh_chat (sender_user_id);
CREATE INDEX online_user_id ON lh_chat (online_user_id);
CREATE INDEX dep_id ON lh_chat (dep_id);
CREATE INDEX product_id ON lh_chat (product_id);
CREATE INDEX unread_operator ON lh_chat (has_unread_op_messages, unread_op_messages_informed);
CREATE INDEX has_unread_messages_dep_id_id ON lh_chat (has_unread_messages,dep_id,id);
CREATE INDEX status_dep_id_id ON lh_chat (status,dep_id,id);
CREATE INDEX status_dep_id_priority_id ON lh_chat (status,dep_id,priority,id);
CREATE INDEX status_priority_id ON lh_chat (status,priority,id);

CREATE SEQUENCE lh_chat_blocked_user_seq;
CREATE TABLE IF NOT EXISTS lh_chat_blocked_user (
	id int NOT NULL DEFAULT NEXTVAL ('lh_chat_blocked_user_seq'),
	ip varchar(100) NOT NULL,
	user_id int NOT NULL,
	datets int NOT NULL,
	PRIMARY KEY (id)
	);

CREATE INDEX ip ON lh_chat_blocked_user (ip);

CREATE SEQUENCE lh_users_online_session_seq;
CREATE TABLE lh_users_online_session ( 
	id bigint NOT NULL DEFAULT NEXTVAL ('lh_users_online_session_seq'), 
	user_id int NOT NULL, 
	time int NOT NULL, 
	duration int NOT NULL, 
	lactivity int NOT NULL, 
	PRIMARY KEY (id) 
);

CREATE INDEX user_id_lactivity ON lh_users_online_session (user_id, lactivity);

CREATE SEQUENCE lh_chat_archive_range_seq;

CREATE TABLE IF NOT EXISTS lh_chat_archive_range (
	id int NOT NULL DEFAULT NEXTVAL ('lh_chat_archive_range_seq'),
	range_from int NOT NULL,
	range_to int NOT NULL,
	PRIMARY KEY (id)
	);

CREATE SEQUENCE lh_abstract_auto_responder_seq;

CREATE TABLE lh_abstract_auto_responder (
	id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_auto_responder_seq'),
	siteaccess varchar(3) NOT NULL,
	wait_message text NOT NULL,
	wait_timeout int NOT NULL,
	position int NOT NULL,
	timeout_message text NOT NULL,
	dep_id int NOT NULL,
	repeat_number int NOT NULL DEFAULT '1',
	wait_timeout_2 int NOT NULL,
	timeout_message_2 text NOT NULL,
	wait_timeout_3 int NOT NULL,
	timeout_message_3 text NOT NULL,
	wait_timeout_4 int NOT NULL,
	timeout_message_4 text NOT NULL,
	wait_timeout_5 int NOT NULL,
	timeout_message_5 text NOT NULL,
	wait_timeout_reply_1 int NOT NULL,
	timeout_reply_message_1 text NOT NULL,
	wait_timeout_reply_2 int NOT NULL,
	timeout_reply_message_2 text NOT NULL,
	wait_timeout_reply_3 int NOT NULL,
	timeout_reply_message_3 text NOT NULL,
	wait_timeout_reply_4 int NOT NULL,
	timeout_reply_message_4 text NOT NULL,
	wait_timeout_reply_5 int NOT NULL,
	timeout_reply_message_5 text NOT NULL,
	ignore_pa_chat int NOT NULL,
	PRIMARY KEY (id)
	);

CREATE INDEX siteaccess_position ON lh_abstract_auto_responder (siteaccess,position);

CREATE SEQUENCE lh_abstract_widget_theme_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_widget_theme (
	id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_widget_theme_seq'),
	name varchar(250) NOT NULL,
	name_company varchar(250) NOT NULL,
	onl_bcolor varchar(10) NOT NULL,
	bor_bcolor varchar(10) NOT NULL DEFAULT 'e3e3e3',
	text_color varchar(10) NOT NULL,
	online_image varchar(250) NOT NULL,
	online_image_path varchar(250) NOT NULL,
	offline_image varchar(250) NOT NULL,
	offline_image_path varchar(250) NOT NULL,
	logo_image varchar(250) NOT NULL,
	logo_image_path varchar(250) NOT NULL,
	need_help_image varchar(250) NOT NULL,
	header_background varchar(10) NOT NULL,
	need_help_tcolor varchar(10) NOT NULL,
	need_help_bcolor varchar(10) NOT NULL,
	need_help_border varchar(10) NOT NULL,
	need_help_close_bg varchar(10) NOT NULL,
	need_help_hover_bg varchar(10) NOT NULL,
	need_help_close_hover_bg varchar(10) NOT NULL,
	need_help_image_path varchar(250) NOT NULL,
	custom_status_css text NOT NULL,
	custom_container_css text NOT NULL,
	custom_widget_css text NOT NULL,
	custom_popup_css text NOT NULL,
	need_help_header varchar(250) NOT NULL,
	need_help_text varchar(250) NOT NULL,
	online_text varchar(250) NOT NULL,
	offline_text varchar(250) NOT NULL,
	widget_border_color varchar(10) NOT NULL,
	copyright_image varchar(250) NOT NULL,
	copyright_image_path varchar(250) NOT NULL,
	widget_copyright_url varchar(250) NOT NULL,
	show_copyright int NOT NULL DEFAULT '1',
	explain_text text NOT NULL,
	intro_operator_text varchar(250) NOT NULL,
	operator_image varchar(250) NOT NULL,
	operator_image_path varchar(250) NOT NULL,
	minimize_image varchar(250) NOT NULL,
	minimize_image_path varchar(250) NOT NULL,
	restore_image varchar(250) NOT NULL,
	restore_image_path varchar(250) NOT NULL,
	close_image varchar(250) NOT NULL,
	close_image_path varchar(250) NOT NULL,
	popup_image varchar(250) NOT NULL,
	popup_image_path varchar(250) NOT NULL,
	support_joined varchar(250) NOT NULL,
	support_closed varchar(250) NOT NULL,
	pending_join varchar(250) NOT NULL,
	noonline_operators varchar(250) NOT NULL,
	noonline_operators_offline varchar(250) NOT NULL,
	hide_close int NOT NULL,
	hide_popup int NOT NULL,
	show_need_help int NOT NULL DEFAULT '1',
	show_need_help_timeout int NOT NULL DEFAULT '24',
	header_height int NOT NULL,
	header_padding int NOT NULL,
	widget_border_width int NOT NULL,
	show_voting smallint NOT NULL DEFAULT '1',
	department_title varchar(250) NOT NULL,
	department_select varchar(250) NOT NULL,
	buble_visitor_background varchar(250) NOT NULL,
	buble_visitor_title_color varchar(250) NOT NULL,
	buble_visitor_text_color varchar(250) NOT NULL,
	buble_operator_background varchar(250) NOT NULL,
	buble_operator_title_color varchar(250) NOT NULL,
	buble_operator_text_color varchar(250) NOT NULL,
	PRIMARY KEY (id)				
	);

CREATE SEQUENCE lh_faq_seq;

CREATE TABLE IF NOT EXISTS lh_faq (
				  id int NOT NULL DEFAULT NEXTVAL ('lh_faq_seq'),
				  question varchar(250) NOT NULL,
				  answer text NOT NULL,
				  url varchar(250) NOT NULL,
				  email varchar(50) NOT NULL,
				  identifier varchar(10) NOT NULL,
				  active int NOT NULL,
				  has_url smallint NOT NULL,
				  is_wildcard smallint NOT NULL,
				  PRIMARY KEY (id)
				);

CREATE INDEX active ON lh_faq (active);
CREATE INDEX active_url ON lh_faq (active,url);
CREATE INDEX has_url ON lh_faq (has_url);
CREATE INDEX identifier ON lh_faq (identifier);
CREATE INDEX is_wildcard ON lh_faq (is_wildcard);

CREATE SEQUENCE lh_cobrowse_seq;

CREATE TABLE IF NOT EXISTS lh_cobrowse (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_cobrowse_seq'),
        	   chat_id int NOT NULL,
        	   online_user_id int NOT NULL,
        	   mtime int NOT NULL,
        	   url varchar(250) NOT NULL,
        	   initialize longtext NOT NULL,
        	   modifications longtext NOT NULL,
        	   finished smallint NOT NULL,
        	   w int NOT NULL,
			   wh int NOT NULL,
			   x int NOT NULL,
			   y int NOT NULL,        	   		
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX chat_id ON lh_cobrowse (chat_id);
CREATE INDEX online_user_id ON lh_cobrowse (online_user_id);
        	           	   
CREATE SEQUENCE lh_abstract_survey_seq;

CREATE TABLE lh_abstract_survey (
        	      id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_survey_seq'),
                  name varchar(250) NOT NULL,
                  feedback_text text NOT NULL,
                  max_stars_1_title varchar(250) NOT NULL,
                  max_stars_1_pos int NOT NULL,
                  max_stars_2_title varchar(250) NOT NULL,
                  max_stars_2_pos int NOT NULL,
                  max_stars_2 int NOT NULL,
                  max_stars_3_title varchar(250) NOT NULL,
                  max_stars_3_pos int NOT NULL,
                  max_stars_3 int NOT NULL,
                  max_stars_4_title varchar(250) NOT NULL,
                  max_stars_4_pos int NOT NULL,
                  max_stars_4 int NOT NULL,
                  max_stars_5_title varchar(250) NOT NULL,
                  max_stars_5_pos int NOT NULL,
                  max_stars_5 int NOT NULL,
                  question_options_1 varchar(250) NOT NULL,
                  question_options_1_items text NOT NULL,
                  question_options_1_pos int NOT NULL,
                  question_options_2 varchar(250) NOT NULL,
                  question_options_2_items text NOT NULL,
                  question_options_2_pos int NOT NULL,
                  question_options_3 varchar(250) NOT NULL,
                  question_options_3_items text NOT NULL,
                  question_options_3_pos int NOT NULL,
                  question_options_4 varchar(250) NOT NULL,
                  question_options_4_items text NOT NULL,
                  question_options_4_pos int NOT NULL,
                  question_options_5 varchar(250) NOT NULL,
                  question_options_5_items text NOT NULL,
                  question_options_5_pos int NOT NULL,
                  question_plain_1 text NOT NULL,
                  question_plain_1_pos int NOT NULL,
                  question_plain_2 text NOT NULL,
                  question_plain_2_pos int NOT NULL,
                  question_plain_3 text NOT NULL,
                  question_plain_3_pos int NOT NULL,
                  question_plain_4 text NOT NULL,
                  question_plain_4_pos int NOT NULL,
                  question_plain_5 text NOT NULL,
                  question_plain_5_pos int NOT NULL,
                  max_stars_1_enabled int NOT NULL,
                  max_stars_2_enabled int NOT NULL,
                  max_stars_3_enabled int NOT NULL,
                  max_stars_4_enabled int NOT NULL,
                  max_stars_5_enabled int NOT NULL,
                  question_options_1_enabled int NOT NULL,
                  question_options_2_enabled int NOT NULL,
                  question_options_3_enabled int NOT NULL,
                  question_options_4_enabled int NOT NULL,
                  question_options_5_enabled int NOT NULL,
                  question_plain_1_enabled int NOT NULL,
                  question_plain_2_enabled int NOT NULL,
                  question_plain_3_enabled int NOT NULL,
                  question_plain_4_enabled int NOT NULL,
                  question_plain_5_enabled int NOT NULL,
                  max_stars_1 int NOT NULL,
                  max_stars_1_req int NOT NULL,
                  max_stars_2_req int NOT NULL,
                  max_stars_3_req int NOT NULL,
                  max_stars_4_req int NOT NULL,
                  max_stars_5_req int NOT NULL,
                  question_options_1_req int NOT NULL,
                  question_options_2_req int NOT NULL,
                  question_options_3_req int NOT NULL,
                  question_options_4_req int NOT NULL,
                  question_options_5_req int NOT NULL,
                  question_plain_1_req int NOT NULL,
                  question_plain_2_req int NOT NULL,
                  question_plain_3_req int NOT NULL,
                  question_plain_4_req int NOT NULL,
                  question_plain_5_req int NOT NULL,
                  PRIMARY KEY (id)
        	   );

CREATE SEQUENCE lh_admin_theme_seq;

CREATE TABLE lh_admin_theme (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_admin_theme_seq'),
        	       name varchar(100) NOT NULL,
        	       static_content longtext NOT NULL,
        	       static_js_content longtext NOT NULL,
        	       static_css_content longtext NOT NULL,
        	       header_content text NOT NULL,
        	       header_css text NOT NULL,
        	       PRIMARY KEY (id)
        	   );

CREATE SEQUENCE lh_chat_paid_seq;

CREATE TABLE lh_chat_paid ( 
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_chat_paid_seq'),  
        	       hash varchar(250) NOT NULL,  
        	       chat_id int NOT NULL, 
        	        PRIMARY KEY (id)  
        	      );

CREATE INDEX hash ON lh_chat_paid (hash);
CREATE INDEX chat_id ON lh_chat_paid (chat_id);

CREATE SEQUENCE lh_abstract_survey_item_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_survey_item (
        	      id bigint NOT NULL DEFAULT NEXTVAL ('lh_abstract_survey_item_seq'),
				  survey_id int NOT NULL,
				  status int NOT NULL,
				  chat_id int NOT NULL,
				  user_id int NOT NULL,
				  ftime int NOT NULL,
				  dep_id int NOT NULL,
				  max_stars_1 int NOT NULL,
				  max_stars_2 int NOT NULL,
				  max_stars_3 int NOT NULL,
				  max_stars_4 int NOT NULL,
				  max_stars_5 int NOT NULL,
				  question_options_1 int NOT NULL,
				  question_options_2 int NOT NULL,
				  question_options_3 int NOT NULL,
				  question_options_4 int NOT NULL,
				  question_options_5 int NOT NULL,
				  question_plain_1 text NOT NULL,
				  question_plain_2 text NOT NULL,
				  question_plain_3 text NOT NULL,
				  question_plain_4 text NOT NULL,
				  question_plain_5 text NOT NULL,
				  PRIMARY KEY (id)
        	   );

CREATE INDEX survey_id ON lh_abstract_survey_item (survey_id);
CREATE INDEX chat_id ON lh_abstract_survey_item (chat_id);
CREATE INDEX user_id ON lh_abstract_survey_item (user_id);
CREATE INDEX dep_id ON lh_abstract_survey_item (dep_id);
CREATE INDEX ftime ON lh_abstract_survey_item (ftime);
CREATE INDEX max_stars_1 ON lh_abstract_survey_item (max_stars_1);
CREATE INDEX max_stars_2 ON lh_abstract_survey_item (max_stars_2);
CREATE INDEX max_stars_3 ON lh_abstract_survey_item (max_stars_3);
CREATE INDEX max_stars_4 ON lh_abstract_survey_item (max_stars_4);
CREATE INDEX max_stars_5 ON lh_abstract_survey_item (max_stars_5);
CREATE INDEX question_options_1 ON lh_abstract_survey_item (question_options_1);
CREATE INDEX question_options_2 ON lh_abstract_survey_item (question_options_2);
CREATE INDEX question_options_3 ON lh_abstract_survey_item (question_options_3);
CREATE INDEX question_options_4 ON lh_abstract_survey_item (question_options_4);
CREATE INDEX question_options_5 ON lh_abstract_survey_item (question_options_5);

CREATE SEQUENCE lh_speech_language_seq;

CREATE TABLE IF NOT EXISTS lh_speech_language (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_speech_language_seq'),
                  name varchar(100) NOT NULL,
                  PRIMARY KEY (id)
               );

CREATE SEQUENCE lh_speech_language_dialect_seq;

CREATE TABLE IF NOT EXISTS lh_speech_language_dialect (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_speech_language_dialect_seq'),
                  language_id int NOT NULL,
                  lang_name varchar(100) NOT NULL,
                  lang_code varchar(100) NOT NULL,
                  PRIMARY KEY (id)
               );

CREATE INDEX language_id ON lh_speech_language_dialect (language_id);


CREATE SEQUENCE lh_speech_chat_language_seq;

CREATE TABLE IF NOT EXISTS lh_speech_chat_language (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_speech_chat_language_seq'),
                  chat_id int NOT NULL,
                  language_id int NOT NULL,
                  dialect varchar(50) NOT NULL,
                  PRIMARY KEY (id)
               ) ;

CREATE INDEX chat_id ON lh_speech_chat_language (chat_id);

CREATE SEQUENCE lh_chat_file_seq;

CREATE TABLE IF NOT EXISTS lh_chat_file (
        	   id int check (id > 0) NOT NULL DEFAULT NEXTVAL ('lh_chat_file_seq'),
        	   name varchar(255) NOT NULL,
        	   upload_name varchar(255) NOT NULL,
        	   size int NOT NULL,
        	   type varchar(255) NOT NULL,
        	   file_path varchar(255) NOT NULL,
        	   extension varchar(255) NOT NULL,
        	   chat_id int NOT NULL,
        	   online_user_id int NOT NULL,
        	   user_id int NOT NULL,
        	   date int NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX chat_id ON lh_chat_file (chat_id);
CREATE INDEX online_user_id ON lh_chat_file (online_user_id);
CREATE INDEX user_id ON lh_chat_file (user_id);

CREATE SEQUENCE lh_abstract_email_template_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_email_template (
				  id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_email_template_seq'),
				  name varchar(250) NOT NULL,
				  from_name varchar(150) NOT NULL,
				  from_name_ac smallint NOT NULL,
				  from_email varchar(150) NOT NULL,
				  from_email_ac smallint NOT NULL,
				  user_mail_as_sender smallint NOT NULL,
				  content text NOT NULL,
				  subject varchar(250) NOT NULL,
				  bcc_recipients varchar(200) NOT NULL,
				  subject_ac smallint NOT NULL,
				  reply_to varchar(150) NOT NULL,
				  reply_to_ac smallint NOT NULL,
				  recipient varchar(150) NOT NULL,
				  PRIMARY KEY (id)
				);

CREATE SEQUENCE lh_question_seq;

CREATE TABLE IF NOT EXISTS lh_question (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_question_seq'),
        	   question varchar(250) NOT NULL,
        	   location varchar(250) NOT NULL,
        	   active int NOT NULL,
        	   priority int NOT NULL,
        	   is_voting int NOT NULL,
        	   question_intro text NOT NULL,
        	   revote int NOT NULL DEFAULT '0',
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX priority ON lh_question (priority);
CREATE INDEX active_priority ON lh_question (active,priority);

CREATE SEQUENCE lh_question_answer_seq;

CREATE TABLE IF NOT EXISTS lh_question_answer (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_question_answer_seq'),
        	   ip bigint NOT NULL,
        	   question_id int NOT NULL,
        	   answer text NOT NULL,
        	   ctime int NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX ip ON lh_question_answer (ip);
CREATE INDEX question_id ON lh_question_answer (question_id);

CREATE SEQUENCE lh_question_option_seq;

CREATE TABLE IF NOT EXISTS lh_question_option (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_question_option_seq'),
        	   question_id int NOT NULL,
        	   option_name varchar(250) NOT NULL,
        	   priority smallint NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX question_id ON lh_question_option (question_id);

CREATE SEQUENCE lh_question_option_answer_seq;

CREATE TABLE IF NOT EXISTS lh_question_option_answer (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_question_option_answer_seq'),
        	   question_id int NOT NULL,
        	   option_id int NOT NULL,
        	   ctime int NOT NULL,
        	   ip bigint NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX question_id ON lh_question_option_answer (question_id);
CREATE INDEX ip ON lh_question_option_answer (ip);

CREATE SEQUENCE lh_abstract_product_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_product (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_product_seq'), 
        	       name varchar(250) NOT NULL, 
        	       disabled int NOT NULL, 
        	       priority int NOT NULL, 
        	       departament_id int NOT NULL 
        	      , 
        	       PRIMARY KEY (id));

CREATE INDEX departament_id ON lh_abstract_product (departament_id);

CREATE SEQUENCE lh_abstract_browse_offer_invitation_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_browse_offer_invitation (
				  id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_browse_offer_invitation_seq'),
				  siteaccess varchar(10) NOT NULL,
				  time_on_site int NOT NULL,
				  content longtext NOT NULL,
				  callback_content longtext NOT NULL,
				  lhc_iframe_content smallint NOT NULL,
				  custom_iframe_url varchar(250) NOT NULL,
				  name varchar(250) NOT NULL,
				  identifier varchar(50) NOT NULL,
				  executed_times int NOT NULL,
				  url varchar(250) NOT NULL,
				  active int NOT NULL,
				  has_url int NOT NULL,
				  is_wildcard int NOT NULL,
				  referrer varchar(250) NOT NULL,
				  priority varchar(250) NOT NULL,
				  hash varchar(40) NOT NULL,
				  width int NOT NULL,
				  height int NOT NULL,
				  unit varchar(10) NOT NULL,
				  PRIMARY KEY (id)
				);

CREATE INDEX active ON lh_abstract_browse_offer_invitation (active);
CREATE INDEX identifier ON lh_abstract_browse_offer_invitation (identifier);

CREATE SEQUENCE lh_abstract_form_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_form (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_form_seq'),
        	   name varchar(100) NOT NULL,        	   
        	   content longtext NOT NULL,
        	   recipient varchar(250) NOT NULL,
        	   active int NOT NULL,
        	   name_attr varchar(250) NOT NULL,
        	   intro_attr varchar(250) NOT NULL,
        	   xls_columns text NOT NULL,
        	   pagelayout varchar(200) NOT NULL,
        	   post_content text NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE SEQUENCE lh_abstract_form_collected_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_form_collected (
				  id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_form_collected_seq'),
				  form_id int NOT NULL,
				  ctime int NOT NULL,
				  ip varchar(250) NOT NULL,
        	   	  identifier varchar(250) NOT NULL,
				  content longtext NOT NULL,
				  PRIMARY KEY (id)
				);

CREATE INDEX form_id ON lh_abstract_form_collected (form_id);

CREATE SEQUENCE lh_chatbox_seq;

CREATE TABLE IF NOT EXISTS lh_chatbox (
				  id int NOT NULL DEFAULT NEXTVAL ('lh_chatbox_seq'),
				  identifier varchar(50) NOT NULL,
				  name varchar(100) NOT NULL,
				  chat_id int NOT NULL,
				  active int NOT NULL,
				  PRIMARY KEY (id)
				);

CREATE INDEX identifier ON lh_chatbox (identifier);

CREATE SEQUENCE lh_canned_msg_seq;

CREATE TABLE IF NOT EXISTS lh_canned_msg (
	id int NOT NULL DEFAULT NEXTVAL ('lh_canned_msg_seq'),
	msg longtext NOT NULL,
	fallback_msg text NOT NULL,
	title varchar(250) NOT NULL,
	explain varchar(250) NOT NULL,
	position int NOT NULL,
	department_id int NOT NULL,
	user_id int NOT NULL,
	delay int NOT NULL,
	auto_send smallint NOT NULL,
	attr_int_1 int NOT NULL,
	attr_int_2 int NOT NULL,
	attr_int_3 int NOT NULL,
	PRIMARY KEY (id)
	);

CREATE INDEX department_id ON lh_canned_msg (department_id);
CREATE INDEX attr_int_1 ON lh_canned_msg (attr_int_1);
CREATE INDEX attr_int_2 ON lh_canned_msg (attr_int_2);
CREATE INDEX attr_int_3 ON lh_canned_msg (attr_int_3);
CREATE INDEX position_title ON lh_canned_msg (position, title);
CREATE INDEX user_id ON lh_canned_msg (user_id);

CREATE SEQUENCE lh_chat_online_user_footprint_seq;

CREATE TABLE IF NOT EXISTS lh_chat_online_user_footprint (
	id int NOT NULL DEFAULT NEXTVAL ('lh_chat_online_user_footprint_seq'),
	chat_id int NOT NULL,
	online_user_id int NOT NULL,
	page varchar(250) NOT NULL,
	vtime varchar(250) NOT NULL,
	PRIMARY KEY (id)
	);

CREATE INDEX chat_id_vtime ON lh_chat_online_user_footprint (chat_id,vtime);
CREATE INDEX online_user_id ON lh_chat_online_user_footprint (online_user_id);

CREATE SEQUENCE lh_abstract_proactive_chat_event_seq;

CREATE TABLE lh_abstract_proactive_chat_event (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_proactive_chat_event_seq'),
        	       vid_id int NOT NULL,
        	       ev_id int NOT NULL,
        	       ts int NOT NULL,
        	       val varchar(50) NOT NULL,
        	       PRIMARY KEY (id)
        	   );

CREATE INDEX vid_id_ev_id_val_ts ON lh_abstract_proactive_chat_event (vid_id,ev_id,val,ts);
CREATE INDEX vid_id_ev_id_ts ON lh_abstract_proactive_chat_event (vid_id,ev_id,ts);

CREATE SEQUENCE lh_abstract_proactive_chat_invitation_event_seq;

CREATE TABLE lh_abstract_proactive_chat_invitation_event (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_proactive_chat_invitation_event_seq'),
        	       invitation_id int NOT NULL,
        	       event_id int NOT NULL,
        	       min_number int NOT NULL,
        	       during_seconds int NOT NULL,
        	       PRIMARY KEY (id)
        	   );

CREATE INDEX invitation_id ON lh_abstract_proactive_chat_invitation_event (invitation_id);
CREATE INDEX event_id ON lh_abstract_proactive_chat_invitation_event (event_id);

CREATE SEQUENCE lh_abstract_proactive_chat_variables_seq;

CREATE TABLE lh_abstract_proactive_chat_variables (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_proactive_chat_variables_seq'),
        	       name varchar(50) NOT NULL,
        	       identifier varchar(50) NOT NULL,
        	       store_timeout int NOT NULL,
        	       filter_val int NOT NULL DEFAULT '0',
        	       PRIMARY KEY (id)
        	   );

CREATE INDEX identifier ON lh_abstract_proactive_chat_variables (identifier);

CREATE SEQUENCE lh_users_setting_seq;

CREATE TABLE IF NOT EXISTS lh_users_setting (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_users_setting_seq'),
        	   user_id int NOT NULL,
        	   identifier varchar(50) NOT NULL,
        	   value text NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX user_id ON lh_users_setting (user_id,identifier);

CREATE SEQUENCE lh_departament_limit_group_member_seq;

CREATE TABLE lh_departament_limit_group_member (  
    	       id int NOT NULL DEFAULT NEXTVAL ('lh_departament_limit_group_member_seq'),  
    	       dep_id int NOT NULL,  
    	       dep_limit_group_id int NOT NULL,  
    	       PRIMARY KEY (id)  
    	      ) 
    	      ;

CREATE INDEX dep_limit_group_id ON lh_departament_limit_group_member (dep_limit_group_id);

CREATE SEQUENCE lh_departament_limit_group_seq;

CREATE TABLE lh_departament_limit_group (  
    	       id int NOT NULL DEFAULT NEXTVAL ('lh_departament_limit_group_seq'),  
    	       name varchar(50) NOT NULL,
    	       pending_max int NOT NULL,  
    	       PRIMARY KEY (id)) 
    	      ;

CREATE SEQUENCE lh_abstract_auto_responder_chat_seq;

CREATE TABLE lh_abstract_auto_responder_chat (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_auto_responder_chat_seq'),
                  chat_id int NOT NULL,
                  auto_responder_id int NOT NULL,
                  wait_timeout_send int NOT NULL,
                  pending_send_status int NOT NULL,
                  active_send_status int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX chat_id ON lh_abstract_auto_responder_chat (chat_id);

CREATE TABLE IF NOT EXISTS lh_users_setting_option (
			  identifier varchar(50) NOT NULL,
			  class varchar(50) NOT NULL,
			  attribute varchar(40) NOT NULL,
			  PRIMARY KEY (identifier)
			);

CREATE TABLE IF NOT EXISTS lh_chat_config (
                  identifier varchar(50) NOT NULL,
                  value text NOT NULL,
                  type smallint NOT NULL DEFAULT '0',
                  explain varchar(250) NOT NULL,
                  hidden int NOT NULL DEFAULT '0',
                  PRIMARY KEY (identifier)
                );


CREATE SEQUENCE lh_chat_online_user_seq;

CREATE TABLE IF NOT EXISTS lh_chat_online_user (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_chat_online_user_seq'),
                  vid varchar(50) NOT NULL,
                  ip varchar(50) NOT NULL,
                  current_page text NOT NULL,
	   	  page_title varchar(250) NOT NULL,
                  referrer text NOT NULL,
                  chat_id int NOT NULL,
                  invitation_seen_count int NOT NULL,
	   	  invitation_id int NOT NULL,
                  last_visit int NOT NULL,
	   	  first_visit int NOT NULL,
	   	  total_visits int NOT NULL,
	   	  pages_count int NOT NULL,
	   	  tt_pages_count int NOT NULL,
	   	  invitation_count int NOT NULL,
	   	  last_check_time int NOT NULL,
	   	  dep_id int NOT NULL,
                  user_agent varchar(250) NOT NULL,
                  notes varchar(250) NOT NULL,
                  user_country_code varchar(50) NOT NULL,
                  user_country_name varchar(50) NOT NULL,
                  visitor_tz varchar(50) NOT NULL,
                  operator_message text NOT NULL,
                  operator_user_proactive varchar(100) NOT NULL,
                  operator_user_id int NOT NULL,
                  message_seen int NOT NULL,
                  message_seen_ts int NOT NULL,
                  user_active int NOT NULL,
	   	  lat varchar(10) NOT NULL,
		  lon varchar(10) NOT NULL,
		  city varchar(100) NOT NULL,
	   	  reopen_chat int NOT NULL,
	   	  time_on_site int NOT NULL,
		  tt_time_on_site int NOT NULL,
	   	  requires_email int NOT NULL,
	   	  requires_username int NOT NULL,
	   	  requires_phone int NOT NULL,
	   	  screenshot_id int NOT NULL,
	   	  identifier varchar(50) NOT NULL,
	   	  operation text NOT NULL,
	   	  online_attr_system text NOT NULL,
	   	  operation_chat text NOT NULL,
	   	  online_attr text NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX vid ON lh_chat_online_user (vid);
CREATE INDEX dep_id ON lh_chat_online_user (dep_id);
CREATE INDEX last_visit_dep_id ON lh_chat_online_user (last_visit,dep_id);

CREATE SEQUENCE lh_abstract_proactive_chat_invitation_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_proactive_chat_invitation (
			  id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_proactive_chat_invitation_seq'),
			  siteaccess varchar(10) NOT NULL,
			  time_on_site int NOT NULL,
			  pageviews int NOT NULL,
			  message text NOT NULL,
			  message_returning text NOT NULL,
			  executed_times int NOT NULL,
			  dep_id int NOT NULL,
			  hide_after_ntimes int NOT NULL,
			  name varchar(50) NOT NULL,
			  operator_ids varchar(100) NOT NULL,
			  wait_message text NOT NULL,
			  timeout_message text NOT NULL,
			  message_returning_nick varchar(250) NOT NULL,
			  referrer varchar(250) NOT NULL,
			  wait_timeout int NOT NULL,
			  show_random_operator int NOT NULL,
			  operator_name varchar(100) NOT NULL,
			  position int NOT NULL,
			  event_invitation int NOT NULL,
			  dynamic_invitation int NOT NULL,
        	   	  identifier varchar(50) NOT NULL,
        	   	  tag varchar(50) NOT NULL,
        	   	  requires_email int NOT NULL,
        	   	  iddle_for int NOT NULL,
        	   	  event_type int NOT NULL,
        	   	  requires_username int NOT NULL,
        	   	  requires_phone int NOT NULL,
        	   	  repeat_number int NOT NULL DEFAULT '1',
				  PRIMARY KEY (id)
				);

CREATE INDEX time_on_site_pageviews_siteaccess_position ON lh_abstract_proactive_chat_invitation (time_on_site,pageviews,siteaccess,identifier,position);
CREATE INDEX identifier ON lh_abstract_proactive_chat_invitation (identifier);
CREATE INDEX dynamic_invitation ON lh_abstract_proactive_chat_invitation (dynamic_invitation);
CREATE INDEX tag ON lh_abstract_proactive_chat_invitation (tag);
CREATE INDEX dep_id ON lh_abstract_proactive_chat_invitation (dep_id);");
        	   
CREATE SEQUENCE lh_chat_accept_seq;
CREATE TABLE IF NOT EXISTS lh_chat_accept (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_chat_accept_seq'),
        	   chat_id int NOT NULL,
        	   hash varchar(50) NOT NULL,
        	   ctime int NOT NULL,
        	   wused int NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX hash ON lh_chat_accept (hash);

CREATE SEQUENCE lh_departament_seq;

CREATE TABLE IF NOT EXISTS lh_departament (
			  id int NOT NULL DEFAULT NEXTVAL ('lh_departament_seq'),
			  name varchar(100) NOT NULL,
			  email varchar(100) NOT NULL,
			  xmpp_recipients text NOT NULL,
			  xmpp_group_recipients text NOT NULL,
			  priority int NOT NULL,
			  sort_priority int NOT NULL,
			  department_transfer_id int NOT NULL,
			  transfer_timeout int NOT NULL,
			  disabled int NOT NULL,
			  hidden int NOT NULL,
			  delay_lm int NOT NULL,
			  max_active_chats int NOT NULL,
			  max_timeout_seconds int NOT NULL,
			  identifier varchar(50) NOT NULL,
			  mod_start_hour int NOT NULL,
			  mod_end_hour int NOT NULL,
			  tud_start_hour int NOT NULL,
			  tud_end_hour int NOT NULL,
			  wed_start_hour int NOT NULL,
			  wed_end_hour int NOT NULL,
			  thd_start_hour int NOT NULL,
			  thd_end_hour int NOT NULL,
			  frd_start_hour int NOT NULL,
			  frd_end_hour int NOT NULL,
			  sad_start_hour int NOT NULL,
			  sad_end_hour int NOT NULL,
			  sud_start_hour int NOT NULL,
			  sud_end_hour int NOT NULL,
			  nc_cb_execute smallint NOT NULL,
			  na_cb_execute smallint NOT NULL,
			  inform_unread smallint NOT NULL,
			  active_balancing smallint NOT NULL,
			  visible_if_online smallint NOT NULL,
			  inform_close int NOT NULL,
			  inform_unread_delay int NOT NULL,
			  inform_options varchar(250) NOT NULL,
			  online_hours_active smallint NOT NULL,
			  inform_delay int NOT NULL,
			  attr_int_1 int NOT NULL,
			  attr_int_2 int NOT NULL,
			  attr_int_3 int NOT NULL,
			  pending_max int NOT NULL,
			  pending_group_max int NOT NULL,
			  active_chats_counter int NOT NULL,
			  pending_chats_counter int NOT NULL,
			  closed_chats_counter int NOT NULL,
			  inform_close_all int NOT NULL,
			  inform_close_all_email varchar(250) NOT NULL,
			  product_configuration varchar(250) NOT NULL,
			  PRIMARY KEY (id)
			);

CREATE INDEX identifier ON lh_departament (identifier);
CREATE INDEX attr_int_1 ON lh_departament (attr_int_1);
CREATE INDEX attr_int_2 ON lh_departament (attr_int_2);
CREATE INDEX attr_int_3 ON lh_departament (attr_int_3);
CREATE INDEX disabled_hidden ON lh_departament (disabled, hidden);
CREATE INDEX sort_priority_name ON lh_departament (sort_priority, name);
CREATE INDEX active_mod ON lh_departament (online_hours_active,mod_start_hour,mod_end_hour);
CREATE INDEX active_tud ON lh_departament (online_hours_active,tud_start_hour,tud_end_hour);
CREATE INDEX active_wed ON lh_departament (online_hours_active,wed_start_hour,wed_end_hour);
CREATE INDEX active_thd ON lh_departament (online_hours_active,thd_start_hour,thd_end_hour);
CREATE INDEX active_frd ON lh_departament (online_hours_active,frd_start_hour,frd_end_hour);
CREATE INDEX active_sad ON lh_departament (online_hours_active,sad_start_hour,sad_end_hour);
CREATE INDEX active_sud ON lh_departament (online_hours_active,sud_start_hour,sud_end_hour);

CREATE SEQUENCE lh_departament_group_user_seq;

CREATE TABLE lh_departament_group_user (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_departament_group_user_seq'),
                  dep_group_id int NOT NULL,
                  user_id int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX dep_group_id ON lh_departament_group_user (dep_group_id);
CREATE INDEX user_id ON lh_departament_group_user (user_id);

CREATE SEQUENCE lh_abstract_product_departament_seq;

CREATE TABLE lh_abstract_product_departament (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_product_departament_seq'),
        	       product_id int NOT NULL,
        	       departament_id int NOT NULL,
        	       PRIMARY KEY (id)
        	   );

CREATE INDEX departament_id ON lh_abstract_product_departament (departament_id);

CREATE SEQUENCE lh_departament_group_member_seq;

CREATE TABLE lh_departament_group_member (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_departament_group_member_seq'),
                  dep_id int NOT NULL,
                  dep_group_id int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX dep_group_id ON lh_departament_group_member (dep_group_id);

CREATE SEQUENCE lh_departament_group_seq;

CREATE TABLE lh_departament_group (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_departament_group_seq'),
                  name varchar(50) NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE SEQUENCE lh_canned_msg_tag_link_seq;

CREATE TABLE lh_canned_msg_tag_link (  
		id int NOT NULL DEFAULT NEXTVAL ('lh_canned_msg_tag_link_seq'),  
		tag_id int NOT NULL,
		canned_id int NOT NULL,  
		PRIMARY KEY (id) 
	) 
	;

CREATE INDEX canned_id ON lh_canned_msg_tag_link (canned_id);
CREATE INDEX tag_id ON lh_canned_msg_tag_link (tag_id);

CREATE SEQUENCE lh_canned_msg_tag_seq;

CREATE TABLE lh_canned_msg_tag (  
		id int NOT NULL DEFAULT NEXTVAL ('lh_canned_msg_tag_seq'),  
		tag varchar(40) NOT NULL, 
		PRIMARY KEY (id) 
	) 
	;

CREATE INDEX tag ON lh_canned_msg_tag (tag);

CREATE SEQUENCE lh_departament_custom_work_hours_seq;

CREATE TABLE IF NOT EXISTS lh_departament_custom_work_hours (
		  id int NOT NULL DEFAULT NEXTVAL ('lh_departament_custom_work_hours_seq'),
		  dep_id int NOT NULL,
		  date_from int NOT NULL,
		  date_to int NOT NULL,
		  start_hour int NOT NULL,
		  end_hour int NOT NULL,
		  PRIMARY KEY (id)
		);

CREATE INDEX dep_id ON lh_departament_custom_work_hours (dep_id);
CREATE INDEX date_from ON lh_departament_custom_work_hours (date_from);
CREATE INDEX search_active ON lh_departament_custom_work_hours (date_from, date_to, dep_id);

CREATE SEQUENCE lh_group_seq;

CREATE TABLE IF NOT EXISTS lh_group (
               id int NOT NULL DEFAULT NEXTVAL ('lh_group_seq'),
               name varchar(50) NOT NULL,
               disabled int NOT NULL,
               PRIMARY KEY (id)
               );

CREATE INDEX disabled ON lh_group (disabled);

CREATE SEQUENCE lh_role_seq;

CREATE TABLE IF NOT EXISTS lh_role (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_role_seq'),
                  name varchar(50) NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE SEQUENCE lh_grouprole_seq;

CREATE TABLE IF NOT EXISTS lh_grouprole (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_grouprole_seq'),
                  group_id int NOT NULL,
                  role_id int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX group_id ON lh_grouprole (role_id,group_id);
CREATE INDEX group_id_primary ON lh_grouprole (group_id);

CREATE SEQUENCE lh_users_seq;

CREATE TABLE IF NOT EXISTS lh_users (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_users_seq'),
                  username varchar(40) NOT NULL,
                  password varchar(200) NOT NULL,
                  email varchar(100) NOT NULL,
                  time_zone varchar(100) NOT NULL,
                  name varchar(100) NOT NULL,
                  surname varchar(100) NOT NULL,
                  filepath varchar(200) NOT NULL,
                  filename varchar(200) NOT NULL,
                  job_title varchar(100) NOT NULL,
                  departments_ids varchar(100) NOT NULL,
                  chat_nickname varchar(100) NOT NULL,
                  xmpp_username varchar(200) NOT NULL,
                  session_id varchar(40) NOT NULL,
                  operation_admin text NOT NULL,
                  skype varchar(50) NOT NULL,
                  disabled smallint NOT NULL,
                  hide_online smallint NOT NULL,
                  all_departments smallint NOT NULL,
                  invisible_mode smallint NOT NULL,
                  inactive_mode smallint NOT NULL,
                  rec_per_req smallint NOT NULL,
                  active_chats_counter int NOT NULL,
                  closed_chats_counter int NOT NULL,
                  pending_chats_counter int NOT NULL,
                  attr_int_1 int NOT NULL,
                  attr_int_2 int NOT NULL,
                  attr_int_3 int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX hide_online ON lh_users (hide_online);
CREATE INDEX rec_per_req ON lh_users (rec_per_req);
CREATE INDEX email ON lh_users (email);
CREATE INDEX xmpp_username ON lh_users (xmpp_username);

CREATE SEQUENCE lh_userdep_seq;

CREATE TABLE IF NOT EXISTS lh_userdep (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_userdep_seq'),
                  user_id int NOT NULL,
                  dep_id int NOT NULL,
                  last_activity int NOT NULL,
                  hide_online int NOT NULL,
                  last_accepted int NOT NULL,
                  active_chats int NOT NULL,
                  type int NOT NULL DEFAULT '0',
                  hide_online_ts int NOT NULL DEFAULT '0',
                  dep_group_id int NOT NULL DEFAULT '0',
                  PRIMARY KEY (id)
                );

CREATE INDEX last_activity_hide_online_dep_id ON lh_userdep (last_activity,hide_online,dep_id);
CREATE INDEX dep_id ON lh_userdep (dep_id);
CREATE INDEX user_id_type ON lh_userdep (user_id,type);



CREATE SEQUENCE lh_group_work_seq;

CREATE TABLE lh_group_work (  
		id int NOT NULL DEFAULT NEXTVAL ('lh_group_work_seq'),  
		group_id int NOT NULL, 
		group_work_id int NOT NULL, 
		PRIMARY KEY (id) 
	) 
	;

CREATE INDEX group_id ON lh_group_work (group_id);

CREATE SEQUENCE lh_transfer_seq;

CREATE TABLE IF NOT EXISTS lh_transfer (
		  id int NOT NULL DEFAULT NEXTVAL ('lh_transfer_seq'),
		  chat_id int NOT NULL,
		  dep_id int NOT NULL,
		  transfer_user_id int NOT NULL,
		  from_dep_id int NOT NULL,
		  transfer_to_user_id int NOT NULL,
		  PRIMARY KEY (id)
		);

CREATE INDEX dep_id ON lh_transfer (dep_id);
CREATE INDEX transfer_user_id_dep_id ON lh_transfer (transfer_user_id,dep_id);
CREATE INDEX transfer_to_user_id ON lh_transfer (transfer_to_user_id);

CREATE SEQUENCE lh_users_remember_seq;

CREATE TABLE IF NOT EXISTS lh_users_remember (
		 id int NOT NULL DEFAULT NEXTVAL ('lh_users_remember_seq'),
		 user_id int NOT NULL,
		 mtime int NOT NULL,
		 PRIMARY KEY (id)
		);

CREATE SEQUENCE lh_abstract_rest_api_key_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_rest_api_key (
                    id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_rest_api_key_seq'),
                    api_key varchar(50) NOT NULL,
                    user_id int NOT NULL,
                    active int NOT NULL DEFAULT '0',
                    PRIMARY KEY (id)
                );

CREATE INDEX api_key ON lh_abstract_rest_api_key (api_key);
CREATE INDEX user_id ON lh_abstract_rest_api_key (user_id);

CREATE SEQUENCE lh_users_session_seq;

CREATE TABLE lh_users_session (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_users_session_seq'),
                  token varchar(40) NOT NULL,
                  device_type int NOT NULL,
                  device_token varchar(255) NOT NULL,
                  user_id int NOT NULL,
                  created_on int NOT NULL,
                  updated_on int NOT NULL,
                  expires_on int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX device_token_device_type ON lh_users_session (device_token,device_type);
CREATE INDEX token ON lh_users_session (token);

CREATE SEQUENCE lh_msg_seq;

CREATE TABLE IF NOT EXISTS lh_msg (
		  id int NOT NULL DEFAULT NEXTVAL ('lh_msg_seq'),
		  msg longtext NOT NULL,
		  time int NOT NULL,
		  chat_id int NOT NULL DEFAULT '0',
		  user_id int NOT NULL DEFAULT '0',
		  name_support varchar(100) NOT NULL,
		  PRIMARY KEY (id)
		);

CREATE INDEX chat_id_id ON lh_msg (chat_id, id);
CREATE INDEX user_id ON lh_msg (user_id);

CREATE SEQUENCE lh_forgotpasswordhash_seq;

CREATE TABLE IF NOT EXISTS lh_forgotpasswordhash (
                id INT NOT NULL DEFAULT NEXTVAL ('lh_forgotpasswordhash_seq') PRIMARY KEY ,
                user_id INT NOT NULL ,
                hash VARCHAR( 40 ) NOT NULL ,
                created INT NOT NULL
                );

CREATE SEQUENCE lh_groupuser_seq;

CREATE TABLE IF NOT EXISTS lh_groupuser (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_groupuser_seq'),
                  group_id int NOT NULL,
                  user_id int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX group_id ON lh_groupuser (group_id);
CREATE INDEX user_id ON lh_groupuser (user_id);
CREATE INDEX group_id_2 ON lh_groupuser (group_id,user_id);

CREATE SEQUENCE lh_rolefunction_seq;

CREATE TABLE IF NOT EXISTS lh_rolefunction (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_rolefunction_seq'),
                  role_id int NOT NULL,
                  module varchar(100) NOT NULL,
                  function varchar(100) NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX role_id ON lh_rolefunction (role_id);"
COMMIT;

START TRANSACTION;
INSERT INTO lh_speech_language (id, name) VALUES
        	   (1,	'Afrikaans'),
        	   (2,	'Bahasa Indonesia'),
        	   (3,	'Bahasa Melayu'),
        	   (4,	'Català'),
        	   (5,	'Čeština'),
        	   (6,	'Deutsch'),
        	   (7,	'English'),
        	   (8,	'Español'),
        	   (9,	'Euskara'),
        	   (10,	'Français'),
        	   (11,	'Galego'),
        	   (12,	'Hrvatski'),
        	   (13,	'IsiZulu'),
        	   (14,	'Íslenska'),
        	   (15,	'Italiano'),
        	   (16,	'Magyar'),
        	   (17,	'Nederlands'),
        	   (18,	'Norsk bokmål'),
        	   (19,	'Polski'),
        	   (20,	'Português'),
        	   (21,	'Română'),
        	   (22,	'Slovenčina'),
        	   (23,	'Suomi'),
        	   (24,	'Svenska'),
        	   (25,	'Türkçe'),
        	   (26,	'български'),
        	   (27,	'Pусский'),
        	   (28,	'Српски'),
        	   (29,	'한국어'),
        	   (30,	'中文'),
        	   (31,	'日本語'),
        	   (32,	'Lingua latīna');
INSERT INTO lh_speech_language_dialect (id, language_id, lang_name, lang_code) VALUES
                (1,	1,	'Afrikaans',	'af-ZA'),
                (2,	2,	'Bahasa Indonesia',	'id-ID'),
                (3,	3,	'Bahasa Melayu',	'ms-MY'),
                (4,	4,	'Català',	'ca-ES'),
                (5,	5,	'Čeština',	'cs-CZ'),
                (6,	6,	'Deutsch',	'de-DE'),
                (7,	7,	'Australia',	'en-AU'),
                (8,	7,	'Canada',	'en-CA'),
                (9,	7,	'India',	'en-IN'),
                (10,	7,	'New Zealand',	'en-NZ'),
                (11,	7,	'South Africa',	'en-ZA'),
                (12,	7,	'United Kingdom',	'en-GB'),
                (13,	7,	'United States',	'en-US'),
                (14,	8,	'Argentina',	'es-AR'),
                (15,	8,	'Bolivia',	'es-BO'),
                (16,	8,	'Chile',	'es-CL'),
                (17,	8,	'Colombia',	'es-CO'),
                (18,	8,	'Costa Rica',	'es-CR'),
                (19,	8,	'Ecuador',	'es-EC'),
                (20,	8,	'El Salvador',	'es-SV'),
                (21,	8,	'España',	'es-ES'),
                (22,	8,	'Estados Unidos',	'es-US'),
                (23,	8,	'Guatemala',	'es-GT'),
                (24,	8,	'Honduras',	'es-HN'),
                (25,	8,	'México',	'es-MX'),
                (26,	8,	'Nicaragua',	'es-NI'),
                (27,	8,	'Panamá',	'es-PA'),
                (28,	8,	'Paraguay',	'es-PY'),
                (29,	8,	'Perú',	'es-PE'),
                (30,	8,	'Puerto Rico',	'es-PR'),
                (31,	8,	'República Dominicana',	'es-DO'),
                (32,	8,	'Uruguay',	'es-UY'),
                (33,	8,	'Venezuela',	'es-VE'),
                (34,	9,	'Euskara',	'eu-ES'),
                (35,	10,	'Français',	'fr-FR'),
                (36,	11,	'Galego',	'gl-ES'),
                (37,	12,	'Hrvatski',	'hr_HR'),
                (38,	13,	'IsiZulu',	'zu-ZA'),
                (39,	14,	'Íslenska',	'is-IS'),
                (40,	15,	'Italia',	'it-IT'),
                (41,	15,	'Svizzera',	'it-CH'),
                (42,	16,	'Magyar',	'hu-HU'),
                (43,	17,	'Nederlands',	'nl-NL'),
                (44,	18,	'Norsk bokmål',	'nb-NO'),
                (45,	19,	'Polski',	'pl-PL'),
                (46,	20,	'Brasil',	'pt-BR'),
                (47,	20,	'Portugal',	'pt-PT'),
                (48,	21,	'Română',	'ro-RO'),
                (49,	22,	'Slovenčina',	'sk-SK'),
                (50,	23,	'Suomi',	'fi-FI'),
                (51,	24,	'Svenska',	'sv-SE'),
                (52,	25,	'Türkçe',	'tr-TR'),
                (53,	26,	'български',	'bg-BG'),
                (54,	27,	'Pусский',	'ru-RU'),
                (55,	28,	'Српски',	'sr-RS'),
                (56,	29,	'한국어',	'ko-KR'),
                (57,	30,	'普通话 (中国大陆)',	'cmn-Hans-CN'),
                (58,	30,	'普通话 (香港)',	'cmn-Hans-HK'),
                (59,	30,	'中文 (台灣)',	'cmn-Hant-TW'),
                (60,	30,	'粵語 (香港)',	'yue-Hant-HK'),
                (61,	31,	'日本語',	'ja-JP'),
                (62,	32,	'Lingua latīna',	'la');
INSERT INTO lh_users_setting_option (identifier, class, attribute) VALUES
        	   ('chat_message',	'',	''),
        	   ('new_chat_sound',	'',	''),
        	   ('enable_pending_list', '', ''),
        	   ('enable_active_list', '', ''),
        	   ('enable_close_list', '', ''),
        	   ('new_user_bn', '', ''),
        	   ('new_user_sound', '', ''),
        	   ('oupdate_timeout', '', ''),
        	   ('ouser_timeout', '', ''),
        	   ('o_department', '', ''),
        	   ('omax_rows', '', ''),
        	   ('ogroup_by', '', ''),
        	   ('omap_depid', '', ''),
        	   ('omap_mtimeout', '', ''),
        	   ('dwo', '', ''),
        	   ('enable_unread_list', '', '');
INSERT INTO "lh_departament" VALUES (1,'Support','','','',0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO "lh_group" VALUES (1,0,'Administrators'),(2,0,'Operators');
INSERT INTO "lh_grouprole" VALUES (1,1,1),(2,2,2);
INSERT INTO "lh_groupuser" VALUES (1,1,1);
INSERT INTO "lh_role" VALUES (1,'Administrators'),(2,'Operators');
INSERT INTO "lh_rolefunction" VALUES (1,1,'*','*'),(2,2,'lhuser','selfedit'),(3,2,'lhuser','changeonlinestatus'),(4,2,'lhuser','changeskypenick'),(5,2,'lhuser','personalcannedmsg'),(6,2,'lhchat','use'),(7,2,'lhchat','chattabschrome'),(8,2,'lhchat','singlechatwindow'),(9,2,'lhchat','allowopenremotechat'),(10,2,'lhchat','allowchattabs'),(11,2,'lhchat','use_onlineusers'),(12,2,'lhfront','use'),(13,2,'lhsystem','use'),(14,2,'lhchat','allowblockusers'),(15,2,'lhsystem','generatejs'),(16,2,'lhsystem','changelanguage'),(17,2,'lhchat','allowtransfer'),(18,2,'lhchat','administratecannedmsg'),(19,2,'lhquestionary','manage_questionary'),(20,2,'lhfaq','manage_faq'),(21,2,'lhchatbox','manage_chatbox'),(22,2,'lhxml','*'),(23,2,'lhfile','use_operator'),(24,2,'lhfile','file_delete_chat');
INSERT INTO "lh_userdep" VALUES (1,1,0,1391881558,0,0,0,0,0);
INSERT INTO lh_abstract_email_template (id, name, from_name, from_name_ac, from_email, from_email_ac, content, subject, subject_ac, reply_to, reply_to_ac, recipient, bcc_recipients, user_mail_as_sender) VALUES
	(1,	'Send mail to user',	'Live Helper Chat',	0,	'',	0,	'Dear {user_chat_nick},rnrn{additional_message}rnrnLive Support response:rn{messages_content}rnrnSincerely,rnLive Support Teamrn',	'{name_surname} has responded to your request',	1,	'',	1,	'',	'',	0),
	(2,	'Support request from user',	'',	0,	'',	0,	'Hello,rnrnUser request data:rnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnrnMessage:rn{message}rnrnAdditional data, if any:rn{additional_data}rnrnURL of page from which user has send request:rn{url_request}rnrnLink to chat if any:rn{prefillchat}rnrnSincerely,rnLive Support Team',	'{name}, {country}, {department}, Support request from user',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(3,	'User mail for himself',	'Live Helper Chat',	0,	'',	0,	'Dear {user_chat_nick},rnrnTranscript:rn{messages_content}rnChat ID: {chat_id}nrnSincerely,rnLive Support Teamrn',	'Chat transcript',	0,	'',	0,	'',	'',	0),
	(4,	'New chat request',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnUser request data:rnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnCreated:	{created}rnUser left:	{user_left}rnWaited:	{waited}rnChat duration:	{chat_duration}rnrnMessage:rn{message}rnrnURL of page from which user has send request:rn{url_request}rnrnClick to accept chat automaticallyrn{url_accept}rnrnSurveyrn{survey}rnrnSincerely,rnLive Support Team',	'New chat request',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(5,	'Chat was closed',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrn{operator} has closed a chatrnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnCreated:	{created}rnUser left:	{user_left}rnWaited:	{waited}rnChat duration:	{chat_duration}rnrnMessage:rn{message}rnrnAdditional data, if any:rn{additional_data}rnrnURL of page from which user has send request:rn{url_request}rnrnSurvey:rn{survey}rnrnSincerely,rnLive Support Team',	'Chat was closed',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(6,	'New FAQ question',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnNew FAQ questionrnEmail: {email}rnrnQuestion:rn{question}rnrnQuestion URL:rn{url_question}rnrnURL to answer a question:rn{url_request}rnrnSincerely,rnLive Support Team',	'New FAQ question',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(7,	'New unread message',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnUser request data:rnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnCreated:	{created}rnUser left:	{user_left}rnWaited:	{waited}rnChat duration:	{chat_duration}rnrnMessage:rn{message}rnrnURL of page from which user has send request:rn{url_request}rnrnClick to accept chat automaticallyrn{url_accept}rnrnSurvey:rn{survey}rnrnSincerely,rnLive Support Team',	'New unread message',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(8,	'Filled form',	'MCFC',	0,	'',	0,	'Hello,rnrnUser has filled a formrnForm name - {form_name}rnUser IP - {ip}rnDownload filled data - {url_download}rnView filled data - {url_view}rnrn{content}rnrnSincerely,rnLive Support Team',	'Filled form - {form_name}',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(9,	'Chat was accepted',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnOperator {user_name} has accepted a chat [{chat_id}]rnrnUser request data:rnName: {name}rnEmail: {email}rnPhone: {phone}rnDepartment: {department}rnCountry: {country}rnCity: {city}rnIP: {ip}rnCreated:	{created}rnUser left:	{user_left}rnWaited:	{waited}rnChat duration:	{chat_duration}rnrnMessage:rn{message}rnrnURL of page from which user has send request:rn{url_request}rnrnClick to accept chat automaticallyrn{url_accept}rnrnSurvey:rn{survey}rnrnSincerely,rnLive Support Team',	'Chat was accepted [{chat_id}]',	0,	'',	0,	'{$adminEmail}',	'',	0),
	(10,	'Permission request',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnOperator {user} has requested these permissionsnrn{permissions}rnrnSincerely,rnLive Support Team',	'Permission request from {user}',	0,	'',	0,	'',	'',	0),
	(11,	'You have unread messages',	'Live Helper Chat',	0,	'',	0,	'Hello,rnrnOperator {operator} has answered to yournrn{messages}rnrnSincerely,rnLive Support Team',	'Operator has answered to your request',	0,	'',	0,	'',	'',	0);

INSERT INTO lh_chat_config (identifier, value, type, explain, hidden) VALUES
                ('tracked_users_cleanup',	'160',	0,	'How many days keep records of online users.',	0),
        	   	('list_online_operators', '0', '0', 'List online operators.', '0'),
        	   	('voting_days_limit',	'7',	0,	'How many days voting widget should not be expanded after last show',	0),
                ('track_online_visitors',	'1',	0,	'Enable online site visitors tracking',	0),
        	   	('pro_active_invite',	'1',	0,	'Is pro active chat invitation active. Online users tracking also has to be enabled',	0),
                ('customer_company_name',	'Live Helper Chat',	0,	'Your company name - visible in bottom left corner',	0),
                ('customer_site_url',	'http://livehelperchat.com',	0,	'Your site URL address',	0),
        	   	('smtp_data',	'a:5:{s:4:"host";s:0:"";s:4:"port";s:2:"25";s:8:"use_smtp";i:0;s:8:"username";s:0:"";s:8:"password";s:0:"";}',	0,	'SMTP configuration',	1),
        	    ('chatbox_data',	'a:6:{i:0;b:0;s:20:"chatbox_auto_enabled";i:0;s:19:"chatbox_secret_hash";s:{$randomHashLength}:"{$randomHash}";s:20:"chatbox_default_name";s:7:"Chatbox";s:17:"chatbox_msg_limit";i:50;s:22:"chatbox_default_opname";s:7:"Manager";}',	0,	'Chatbox configuration',	1),
                ('start_chat_data',	'a:23:{i:0;b:0;s:21:"name_visible_in_popup";b:1;s:27:"name_visible_in_page_widget";b:1;s:19:"name_require_option";s:8:"required";s:22:"email_visible_in_popup";b:0;s:28:"email_visible_in_page_widget";b:0;s:20:"email_require_option";s:8:"required";s:24:"message_visible_in_popup";b:1;s:30:"message_visible_in_page_widget";b:1;s:22:"message_require_option";s:8:"required";s:22:"phone_visible_in_popup";b:0;s:28:"phone_visible_in_page_widget";b:0;s:20:"phone_require_option";s:8:"required";s:21:"force_leave_a_message";b:0;s:29:"offline_name_visible_in_popup";b:1;s:35:"offline_name_visible_in_page_widget";b:1;s:27:"offline_name_require_option";s:8:"required";s:30:"offline_phone_visible_in_popup";b:0;s:36:"offline_phone_visible_in_page_widget";b:0;s:28:"offline_phone_require_option";s:8:"required";s:32:"offline_message_visible_in_popup";b:1;s:38:"offline_message_visible_in_page_widget";b:1;s:30:"offline_message_require_option";s:8:"required";}',	0,	'',	1),
                ('application_name',	'a:6:{s:3:"eng";s:31:"Live Helper Chat - live support";s:3:"lit";s:26:"Live Helper Chat - pagalba";s:3:"hrv";s:0:"";s:3:"esp";s:0:"";s:3:"por";s:0:"";s:10:"site_admin";s:31:"Live Helper Chat - live support";}',	1,	'Support application name, visible in browser title.',	0),
                ('track_footprint',	'0',	0,	'Track users footprint. For this also online visitors tracking should be enabled',	0),
                ('pro_active_limitation',	'-1',	0,	'Pro active chats invitations limitation based on pending chats, (-1) do not limit, (0,1,n+1) number of pending chats can be for invitation to be shown.',	0),
                ('pro_active_show_if_offline',	'0',	0,	'Should invitation logic be executed if there is no online operators',	0),
                ('export_hash',	'{$exportHash}',	0,	'Chats export secret hash',	0),
                ('message_seen_timeout', 24, 0, 'Proactive message timeout in hours. After how many hours proactive chat mesasge should be shown again.',	0),
                ('reopen_chat_enabled',1,	0,	'Reopen chat functionality enabled',	0),
                ('ignorable_ip',	'',	0,	'Which ip should be ignored in online users list, separate by comma',0),
                ('run_departments_workflow', 0, 0, 'Should cronjob run departments transfer workflow, even if user leaves a chat',	0),
                ('geo_location_data', 'a:3:{s:4:"zoom";i:4;s:3:"lat";s:7:"49.8211";s:3:"lng";s:7:"11.7835";}', '0', '', '1'),
                ('xmp_data','a:14:{i:0;b:0;s:4:"host";s:15:"talk.google.com";s:6:"server";s:9:"gmail.com";s:8:"resource";s:6:"xmpphp";s:4:"port";s:4:"5222";s:7:"use_xmp";i:0;s:8:"username";s:0:"";s:8:"password";s:0:"";s:11:"xmp_message";s:98:"New chat request [{chat_id}] from [{department}]rn{messages}rnClick to accept a chatrn{url_accept}";s:10:"recipients";s:0:"";s:20:"xmp_accepted_message";s:89:"{user_name} has accepted a chat [{chat_id}] from [{department}]rn{messages}rn{url_accept}";s:16:"use_standard_xmp";i:0;s:15:"test_recipients";s:0:"";s:21:"test_group_recipients";s:0:"";}',0,'XMP data',1),
                ('run_unaswered_chat_workflow', 0, 0, 'Should cronjob run unanswered chats workflow and execute unaswered chats callback, 0 - no, any other number bigger than 0 is a minits how long chat have to be not accepted before executing callback.',0),
                ('disable_popup_restore', 0, 0, 'Disable option in widget to open new window. Restore icon will be hidden',	0),
                ('accept_tos_link', '#', 0, 'Change to your site Terms of Service', 0),
                ('hide_button_dropdown', '0', 0, 'Hide close button in dropdown', 0),
                ('on_close_exit_chat', '0', 0, 'On chat close exit chat', 0),
                ('activity_timeout', '5', 0, 'How long operator should go offline automatically because of inactivity. Value in minutes', 0),
                ('product_enabled_module','0','0','Product module is enabled', '1'),
                ('product_show_departament','0','0','Enable products show by departments', '1'),
                ('paidchat_data','','0','Paid chat configuration','1'),
                ('disable_iframe_sharing',	'1',	0,	'Disable iframes in sharing mode',	0),
                ('file_configuration',	'a:7:{i:0;b:0;s:5:"ft_op";s:43:"gif|jpe?g|png|zip|rar|xls|doc|docx|xlsx|pdf";s:5:"ft_us";s:26:"gif|jpe?g|png|doc|docx|pdf";s:6:"fs_max";i:2048;s:18:"active_user_upload";b:0;s:16:"active_op_upload";b:1;s:19:"active_admin_upload";b:1;}',	0,	'Files configuration item',	1),
                ('accept_chat_link_timeout',	'300',	0,	'How many seconds chat accept link is valid. Set 0 to force login all the time manually.',	0),
                ('session_captcha',0,	0,	'Use session captcha. LHC have to be installed on the same domain or subdomain.',	0),
                ('sync_sound_settings',	'a:16:{i:0;b:0;s:12:"repeat_sound";i:1;s:18:"repeat_sound_delay";i:5;s:10:"show_alert";b:0;s:22:"new_chat_sound_enabled";b:1;s:31:"new_message_sound_admin_enabled";b:1;s:30:"new_message_sound_user_enabled";b:1;s:14:"online_timeout";d:300;s:22:"check_for_operator_msg";d:10;s:21:"back_office_sinterval";d:10;s:22:"chat_message_sinterval";d:3.5;s:20:"long_polling_enabled";b:0;s:30:"polling_chat_message_sinterval";d:1.5;s:29:"polling_back_office_sinterval";d:5;s:18:"connection_timeout";i:30;s:28:"browser_notification_message";b:0;}',	0,	'',	1),
                ('sound_invitation', 1, 0, 'Play sound on invitation to chat.',	0),
                ('explicit_http_mode', '',0,'Please enter explicit http mode. Either http: or https:, do not forget : at the end.', '0'),
                ('track_domain',	'',	0,	'Set your domain to enable user tracking across different domain subdomains.',	0),
                ('max_message_length','500',0,'Maximum message length in characters', '0'),
                ('need_help_tip','1',0,'Show need help tooltip?', '0'),
                ('need_help_tip_timeout','24',0,'Need help tooltip timeout, after how many hours show again tooltip?', '0'),
                ('use_secure_cookie','0',0,'Use secure cookie, check this if you want to force SSL all the time', '0'),
                ('faq_email_required','0',0,'Is visitor e-mail required for FAQ', '0'),
                ('disable_print','0',0,'Disable chat print', '0'),
                ('hide_disabled_department','1',0,'Hide disabled department widget', '0'),
                ('disable_send','0',0,'Disable chat transcript send', '0'),
                ('ignore_user_status','0',0,'Ignore users online statuses and use departments online hours', '0'),
                ('bbc_button_visible','1',0,'Show BB Code button', '0'),
                ('activity_track_all','0','0','Track all logged operators activity and ignore their individual settings.','0'),
                ('allow_reopen_closed','1', 0, 'Allow user to reopen closed chats?', '0'),
                ('reopen_as_new','1', 0, 'Reopen closed chat as new? Otherwise it will be reopened as active.', '0'),
                ('default_theme_id','0', 0, 'Default theme ID.', '1'),  
                ('default_admin_theme_id','0', 0, 'Default admin theme ID', '1'),  
                ('translation_data',	'a:6:{i:0;b:0;s:19:"translation_handler";s:4:"bing";s:19:"enable_translations";b:0;s:14:"bing_client_id";s:0:"";s:18:"bing_client_secret";s:0:"";s:14:"google_api_key";s:0:"";}',	0,	'Translation data',	1),              
                ('disable_html5_storage','1',0,'Disable HMTL5 storage, check it if your site is switching between http and https', '0'),
                ('automatically_reopen_chat','1',0,'Automatically reopen chat on widget open', '0'),
                ('autoclose_timeout','0', 0, 'Automatic chats closing. 0 - disabled, n > 0 time in minutes before chat is automatically closed', '0'),
                ('autopurge_timeout','0', 0, 'Automatic chats purging. 0 - disabled, n > 0 time in minutes before chat is automatically deleted', '0'),
                ('update_ip',	'127.0.0.1',	0,	'Which ip should be allowed to update DB by executing http request, separate by comma?',0),
                ('track_if_offline',	'0',	0,	'Track online visitors even if there is no online operators',0),
                ('min_phone_length','8',0,'Minimum phone number length',0),
                ('mheight','',0,'Messages box height',0),
                ('inform_unread_message','0',0,'Inform visitor about unread messages from operator, value in minutes. 0 - disabled',0),
                ('dashboard_order', '[["online_operators","departments_stats","online_visitors"],["pending_chats","unread_chats","transfered_chats"],["active_chats","closed_chats"]]', '0', 'Home page dashboard widgets order', '0'),
                ('banned_ip_range','',0,'Which ip should not be allowed to chat',0),
                ('suggest_leave_msg','1',0,'Suggest user to leave a message then user chooses offline department',0),
                ('checkstatus_timeout','0',0,'Interval between chat status checks in seconds, 0 disabled.',0),
                ('show_language_switcher','0',0,'Show users option to switch language at widget',0),
                ('sharing_auto_allow','0',0,'Do not ask permission for users to see their screen',0),
                ('sharing_nodejs_enabled','0',0,'NodeJs support enabled',0),
                ('sharing_nodejs_path','',0,'socket.io path, optional',0),
                ('online_if','0','0','','0'),
                ('track_mouse_activity','0','0','Should mouse movement be tracked as activity measure, if not checked only basic events would be tracked','0'),
                ('track_activity','0','0','Track users activity on site?','0'),
                ('autologin_data','a:3:{i:0;b:0;s:11:"secret_hash";s:16:"please_change_me";s:7:"enabled";i:0;}',0,'Autologin configuration data',	1),
                ('sharing_nodejs_secure','0',0,'Connect to NodeJs in https mode',0),
                ('disable_js_execution','1',0,'Disable JS execution in Co-Browsing operator window',0),
                ('sharing_nodejs_socket_host','',0,'Host where NodeJs is running',0),
                ('hide_right_column_frontpage','0','0','Hide right column in frontpage','0'),
                ('front_tabs', 'dashboard,online_users,online_map', '0', 'Home page tabs order', '0'),
                ('speech_data',	'a:3:{i:0;b:0;s:8:"language";i:7;s:7:"dialect";s:5:"en-US";}',	1,	'',	1),
                ('sharing_nodejs_sllocation','https://cdn.socket.io/socket.io-1.1.0.js',0,'Location of SocketIO JS library',0),
                ('track_is_online','0',0,'Track is user still on site, chat status checks also has to be enabled',0),
				('show_languages','eng,lit,hrv,esp,por,nld,ara,ger,pol,rus,ita,fre,chn,cse,nor,tur,vnm,idn,sve,per,ell,dnk,rou,bgr,tha,geo,fin,alb',0,'Between what languages user should be able to switch',0),
                ('geoadjustment_data',	'a:8:{i:0;b:0;s:18:"use_geo_adjustment";b:0;s:13:"available_for";s:0:"";s:15:"other_countries";s:6:"custom";s:8:"hide_for";s:0:"";s:12:"other_status";s:7:"offline";s:11:"rest_status";s:6:"hidden";s:12:"apply_widget";i:0;}',	0,	'Geo adjustment settings',	1);

INSERT INTO "lh_users" VALUES (1,'admin','44f7fa28bdd2ffbd74dbde0684728bb6dc132178','admin@example.com','','Support','Support','','','','','','','','',0,0,0,0,0,0,0,1,0,0,0,0,'');
INSERT INTO "lh_users_setting" VALUES (1,1,'user_language','en_EN'),(2,1,'enable_pending_list','1'),(3,1,'enable_active_list','1'),(4,1,'enable_close_list','0'),(5,1,'enable_unread_list','1'),(6,1,'new_chat_sound','1'),(7,1,'chat_message','1');

--INSERT INTO lh_userdep (user_id,dep_id,last_activity,hide_online,last_accepted,active_chats,type,dep_group_id) VALUES ({$UserData->id},0,0,0,0,0,0,0)
COMMIT;