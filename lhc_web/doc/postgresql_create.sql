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

CREATE INDEX lh_chat_status_user_id ON lh_chat (status,user_id);
CREATE INDEX lh_chat_user_id_sender_user_id ON lh_chat (user_id, sender_user_id);
CREATE INDEX lh_chat_unanswered_chat ON lh_chat (unanswered_chat);
CREATE INDEX lh_chat_sender_user_id ON lh_chat (sender_user_id);
CREATE INDEX lh_chat_online_user_id ON lh_chat (online_user_id);
CREATE INDEX lh_chat_dep_id ON lh_chat (dep_id);
CREATE INDEX lh_chat_product_id ON lh_chat (product_id);
CREATE INDEX lh_chat_unread_operator ON lh_chat (has_unread_op_messages, unread_op_messages_informed);
CREATE INDEX lh_chat_has_unread_messages_dep_id_id ON lh_chat (has_unread_messages,dep_id,id);
CREATE INDEX lh_chat_status_dep_id_id ON lh_chat (status,dep_id,id);
CREATE INDEX lh_chat_status_dep_id_priority_id ON lh_chat (status,dep_id,priority,id);
CREATE INDEX lh_chat_status_priority_id ON lh_chat (status,priority,id);

CREATE SEQUENCE lh_chat_blocked_user_seq;
CREATE TABLE IF NOT EXISTS lh_chat_blocked_user (
	id int NOT NULL DEFAULT NEXTVAL ('lh_chat_blocked_user_seq'),
	ip varchar(100) NOT NULL,
	user_id int NOT NULL,
	datets int NOT NULL,
	PRIMARY KEY (id)
	);

CREATE INDEX lh_chat_blocked_user_ip ON lh_chat_blocked_user (ip);

CREATE SEQUENCE lh_users_online_session_seq;
CREATE TABLE IF NOT EXISTS lh_users_online_session ( 
	id bigint NOT NULL DEFAULT NEXTVAL ('lh_users_online_session_seq'), 
	user_id int NOT NULL, 
	time int NOT NULL, 
	duration int NOT NULL, 
	lactivity int NOT NULL, 
	PRIMARY KEY (id) 
);

CREATE INDEX lh_users_online_session_user_id_lactivity ON lh_users_online_session (user_id, lactivity);

CREATE SEQUENCE lh_chat_archive_range_seq;

CREATE TABLE IF NOT EXISTS lh_chat_archive_range (
	id int NOT NULL DEFAULT NEXTVAL ('lh_chat_archive_range_seq'),
	range_from int NOT NULL,
	range_to int NOT NULL,
	PRIMARY KEY (id)
	);

CREATE SEQUENCE lh_abstract_auto_responder_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_auto_responder (
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

CREATE INDEX lh_abstract_auto_responder_siteaccess_position ON lh_abstract_auto_responder (siteaccess,position);

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

CREATE INDEX lh_faq_active ON lh_faq (active);
CREATE INDEX lh_faq_active_url ON lh_faq (active,url);
CREATE INDEX lh_faq_has_url ON lh_faq (has_url);
CREATE INDEX lh_faq_identifier ON lh_faq (identifier);
CREATE INDEX lh_faq_is_wildcard ON lh_faq (is_wildcard);

CREATE SEQUENCE lh_cobrowse_seq;

CREATE TABLE IF NOT EXISTS lh_cobrowse (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_cobrowse_seq'),
        	   chat_id int NOT NULL,
        	   online_user_id int NOT NULL,
        	   mtime int NOT NULL,
        	   url varchar(250) NOT NULL,
        	   initialize text NOT NULL,
        	   modifications text NOT NULL,
        	   finished smallint NOT NULL,
        	   w int NOT NULL,
			   wh int NOT NULL,
			   x int NOT NULL,
			   y int NOT NULL,        	   		
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX lh_cobrowse_chat_id ON lh_cobrowse (chat_id);
CREATE INDEX lh_cobrowse_online_user_id ON lh_cobrowse (online_user_id);
        	           	   
CREATE SEQUENCE lh_abstract_survey_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_survey (
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

CREATE TABLE IF NOT EXISTS lh_admin_theme (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_admin_theme_seq'),
        	       name varchar(100) NOT NULL,
        	       static_content text NOT NULL,
        	       static_js_content text NOT NULL,
        	       static_css_content text NOT NULL,
        	       header_content text NOT NULL,
        	       header_css text NOT NULL,
        	       PRIMARY KEY (id)
        	   );

CREATE SEQUENCE lh_chat_paid_seq;

CREATE TABLE IF NOT EXISTS lh_chat_paid ( 
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_chat_paid_seq'),  
        	       hash varchar(250) NOT NULL,  
        	       chat_id int NOT NULL, 
        	        PRIMARY KEY (id)  
        	      );

CREATE INDEX lh_chat_paid_hash ON lh_chat_paid (hash);
CREATE INDEX lh_chat_paid_chat_id ON lh_chat_paid (chat_id);

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

CREATE INDEX lh_abstract_survey_item_survey_id ON lh_abstract_survey_item (survey_id);
CREATE INDEX lh_abstract_survey_item_chat_id ON lh_abstract_survey_item (chat_id);
CREATE INDEX lh_abstract_survey_item_user_id ON lh_abstract_survey_item (user_id);
CREATE INDEX lh_abstract_survey_item_dep_id ON lh_abstract_survey_item (dep_id);
CREATE INDEX lh_abstract_survey_item_ftime ON lh_abstract_survey_item (ftime);
CREATE INDEX lh_abstract_survey_item_max_stars_1 ON lh_abstract_survey_item (max_stars_1);
CREATE INDEX lh_abstract_survey_item_max_stars_2 ON lh_abstract_survey_item (max_stars_2);
CREATE INDEX lh_abstract_survey_item_max_stars_3 ON lh_abstract_survey_item (max_stars_3);
CREATE INDEX lh_abstract_survey_item_max_stars_4 ON lh_abstract_survey_item (max_stars_4);
CREATE INDEX lh_abstract_survey_item_max_stars_5 ON lh_abstract_survey_item (max_stars_5);
CREATE INDEX lh_abstract_survey_item_question_options_1 ON lh_abstract_survey_item (question_options_1);
CREATE INDEX lh_abstract_survey_item_question_options_2 ON lh_abstract_survey_item (question_options_2);
CREATE INDEX lh_abstract_survey_item_question_options_3 ON lh_abstract_survey_item (question_options_3);
CREATE INDEX lh_abstract_survey_item_question_options_4 ON lh_abstract_survey_item (question_options_4);
CREATE INDEX lh_abstract_survey_item_question_options_5 ON lh_abstract_survey_item (question_options_5);

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

CREATE INDEX lh_speech_language_dialect_language_id ON lh_speech_language_dialect (language_id);


CREATE SEQUENCE lh_speech_chat_language_seq;

CREATE TABLE IF NOT EXISTS lh_speech_chat_language (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_speech_chat_language_seq'),
                  chat_id int NOT NULL,
                  language_id int NOT NULL,
                  dialect varchar(50) NOT NULL,
                  PRIMARY KEY (id)
               ) ;

CREATE INDEX lh_speech_chat_language_chat_id ON lh_speech_chat_language (chat_id);

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

CREATE INDEX lh_chat_file_chat_id ON lh_chat_file (chat_id);
CREATE INDEX lh_chat_file_online_user_id ON lh_chat_file (online_user_id);
CREATE INDEX lh_chat_file_user_id ON lh_chat_file (user_id);

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

CREATE INDEX lh_question_priority ON lh_question (priority);
CREATE INDEX lh_question_active_priority ON lh_question (active,priority);

CREATE SEQUENCE lh_question_answer_seq;

CREATE TABLE IF NOT EXISTS lh_question_answer (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_question_answer_seq'),
        	   ip bigint NOT NULL,
        	   question_id int NOT NULL,
        	   answer text NOT NULL,
        	   ctime int NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX lh_question_answer_ip ON lh_question_answer (ip);
CREATE INDEX lh_question_answer_question_id ON lh_question_answer (question_id);

CREATE SEQUENCE lh_question_option_seq;

CREATE TABLE IF NOT EXISTS lh_question_option (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_question_option_seq'),
        	   question_id int NOT NULL,
        	   option_name varchar(250) NOT NULL,
        	   priority smallint NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX lh_question_option_question_id ON lh_question_option (question_id);

CREATE SEQUENCE lh_question_option_answer_seq;

CREATE TABLE IF NOT EXISTS lh_question_option_answer (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_question_option_answer_seq'),
        	   question_id int NOT NULL,
        	   option_id int NOT NULL,
        	   ctime int NOT NULL,
        	   ip bigint NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX lh_question_option_answer_question_id ON lh_question_option_answer (question_id);
CREATE INDEX lh_question_option_answer_ip ON lh_question_option_answer (ip);

CREATE SEQUENCE lh_abstract_product_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_product (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_product_seq'), 
        	       name varchar(250) NOT NULL, 
        	       disabled int NOT NULL, 
        	       priority int NOT NULL, 
        	       departament_id int NOT NULL 
        	      , 
        	       PRIMARY KEY (id));

CREATE INDEX lh_abstract_product_departament_id ON lh_abstract_product (departament_id);

CREATE SEQUENCE lh_abstract_browse_offer_invitation_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_browse_offer_invitation (
				  id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_browse_offer_invitation_seq'),
				  siteaccess varchar(10) NOT NULL,
				  time_on_site int NOT NULL,
				  content text NOT NULL,
				  callback_content text NOT NULL,
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

CREATE INDEX lh_abstract_browse_offer_invitation_active ON lh_abstract_browse_offer_invitation (active);
CREATE INDEX lh_abstract_browse_offer_invitation_identifier ON lh_abstract_browse_offer_invitation (identifier);

CREATE SEQUENCE lh_abstract_form_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_form (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_form_seq'),
        	   name varchar(100) NOT NULL,        	   
        	   content text NOT NULL,
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
				  content text NOT NULL,
				  PRIMARY KEY (id)
				);

CREATE INDEX lh_abstract_form_collected_form_id ON lh_abstract_form_collected (form_id);

CREATE SEQUENCE lh_chatbox_seq;

CREATE TABLE IF NOT EXISTS lh_chatbox (
				  id int NOT NULL DEFAULT NEXTVAL ('lh_chatbox_seq'),
				  identifier varchar(50) NOT NULL,
				  name varchar(100) NOT NULL,
				  chat_id int NOT NULL,
				  active int NOT NULL,
				  PRIMARY KEY (id)
				);

CREATE INDEX lh_chatbox_identifier ON lh_chatbox (identifier);

CREATE SEQUENCE lh_canned_msg_seq;

CREATE TABLE IF NOT EXISTS lh_canned_msg (
	id int NOT NULL DEFAULT NEXTVAL ('lh_canned_msg_seq'),
	msg text NOT NULL,
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

CREATE INDEX lh_canned_msg_department_id ON lh_canned_msg (department_id);
CREATE INDEX lh_canned_msg_attr_int_1 ON lh_canned_msg (attr_int_1);
CREATE INDEX lh_canned_msg_attr_int_2 ON lh_canned_msg (attr_int_2);
CREATE INDEX lh_canned_msg_attr_int_3 ON lh_canned_msg (attr_int_3);
CREATE INDEX lh_canned_msg_position_title ON lh_canned_msg (position, title);
CREATE INDEX lh_canned_msg_user_id ON lh_canned_msg (user_id);

CREATE SEQUENCE lh_chat_online_user_footprint_seq;

CREATE TABLE IF NOT EXISTS lh_chat_online_user_footprint (
	id int NOT NULL DEFAULT NEXTVAL ('lh_chat_online_user_footprint_seq'),
	chat_id int NOT NULL,
	online_user_id int NOT NULL,
	page varchar(250) NOT NULL,
	vtime varchar(250) NOT NULL,
	PRIMARY KEY (id)
	);

CREATE INDEX lh_chat_online_user_footprint_chat_id_vtime ON lh_chat_online_user_footprint (chat_id,vtime);
CREATE INDEX lh_chat_online_user_footprint_online_user_id ON lh_chat_online_user_footprint (online_user_id);

CREATE SEQUENCE lh_abstract_proactive_chat_event_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_proactive_chat_event (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_proactive_chat_event_seq'),
        	       vid_id int NOT NULL,
        	       ev_id int NOT NULL,
        	       ts int NOT NULL,
        	       val varchar(50) NOT NULL,
        	       PRIMARY KEY (id)
        	   );

CREATE INDEX lh_abstract_proactive_chat_event_vid_id_ev_id_val_ts ON lh_abstract_proactive_chat_event (vid_id,ev_id,val,ts);
CREATE INDEX lh_abstract_proactive_chat_event_vid_id_ev_id_ts ON lh_abstract_proactive_chat_event (vid_id,ev_id,ts);

CREATE SEQUENCE lh_abstract_proactive_chat_invitation_event_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_proactive_chat_invitation_event (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_proactive_chat_invitation_event_seq'),
        	       invitation_id int NOT NULL,
        	       event_id int NOT NULL,
        	       min_number int NOT NULL,
        	       during_seconds int NOT NULL,
        	       PRIMARY KEY (id)
        	   );

CREATE INDEX lh_abstract_proactive_chat_invitation_event_invitation_id ON lh_abstract_proactive_chat_invitation_event (invitation_id);
CREATE INDEX lh_abstract_proactive_chat_invitation_event_event_id ON lh_abstract_proactive_chat_invitation_event (event_id);

CREATE SEQUENCE lh_abstract_proactive_chat_variables_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_proactive_chat_variables (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_proactive_chat_variables_seq'),
        	       name varchar(50) NOT NULL,
        	       identifier varchar(50) NOT NULL,
        	       store_timeout int NOT NULL,
        	       filter_val int NOT NULL DEFAULT '0',
        	       PRIMARY KEY (id)
        	   );

CREATE INDEX lh_abstract_proactive_chat_variables_identifier ON lh_abstract_proactive_chat_variables (identifier);

CREATE SEQUENCE lh_users_setting_seq;

CREATE TABLE IF NOT EXISTS lh_users_setting (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_users_setting_seq'),
        	   user_id int NOT NULL,
        	   identifier varchar(50) NOT NULL,
        	   value text NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX lh_users_setting_user_id ON lh_users_setting (user_id,identifier);

CREATE SEQUENCE lh_departament_limit_group_member_seq;

CREATE TABLE IF NOT EXISTS lh_departament_limit_group_member (  
    	       id int NOT NULL DEFAULT NEXTVAL ('lh_departament_limit_group_member_seq'),  
    	       dep_id int NOT NULL,  
    	       dep_limit_group_id int NOT NULL,  
    	       PRIMARY KEY (id)  
    	      ) 
    	      ;

CREATE INDEX lh_departament_limit_group_member_dep_limit_group_id ON lh_departament_limit_group_member (dep_limit_group_id);

CREATE SEQUENCE lh_departament_limit_group_seq;

CREATE TABLE IF NOT EXISTS lh_departament_limit_group (  
    	       id int NOT NULL DEFAULT NEXTVAL ('lh_departament_limit_group_seq'),  
    	       name varchar(50) NOT NULL,
    	       pending_max int NOT NULL,  
    	       PRIMARY KEY (id)) 
    	      ;

CREATE SEQUENCE lh_abstract_auto_responder_chat_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_auto_responder_chat (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_auto_responder_chat_seq'),
                  chat_id int NOT NULL,
                  auto_responder_id int NOT NULL,
                  wait_timeout_send int NOT NULL,
                  pending_send_status int NOT NULL,
                  active_send_status int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX lh_abstract_auto_responder_chat_chat_id ON lh_abstract_auto_responder_chat (chat_id);

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

CREATE INDEX lh_chat_online_user_vid ON lh_chat_online_user (vid);
CREATE INDEX lh_chat_online_user_dep_id ON lh_chat_online_user (dep_id);
CREATE INDEX lh_chat_online_user_last_visit_dep_id ON lh_chat_online_user (last_visit,dep_id);

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

CREATE INDEX lh_abstract_proactive_chat_invitation_time_on_site_pageviews_siteaccess_position ON lh_abstract_proactive_chat_invitation (time_on_site,pageviews,siteaccess,identifier,position);
CREATE INDEX lh_abstract_proactive_chat_invitation_identifier ON lh_abstract_proactive_chat_invitation (identifier);
CREATE INDEX lh_abstract_proactive_chat_invitation_dynamic_invitation ON lh_abstract_proactive_chat_invitation (dynamic_invitation);
CREATE INDEX lh_abstract_proactive_chat_invitation_tag ON lh_abstract_proactive_chat_invitation (tag);
CREATE INDEX lh_abstract_proactive_chat_invitation_dep_id ON lh_abstract_proactive_chat_invitation (dep_id);
        	   
CREATE SEQUENCE lh_chat_accept_seq;
CREATE TABLE IF NOT EXISTS lh_chat_accept (
        	   id int NOT NULL DEFAULT NEXTVAL ('lh_chat_accept_seq'),
        	   chat_id int NOT NULL,
        	   hash varchar(50) NOT NULL,
        	   ctime int NOT NULL,
        	   wused int NOT NULL,
        	   PRIMARY KEY (id)
        	   );

CREATE INDEX lh_chat_accept_hash ON lh_chat_accept (hash);

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

CREATE INDEX lh_departament_identifier ON lh_departament (identifier);
CREATE INDEX lh_departament_attr_int_1 ON lh_departament (attr_int_1);
CREATE INDEX lh_departament_attr_int_2 ON lh_departament (attr_int_2);
CREATE INDEX lh_departament_attr_int_3 ON lh_departament (attr_int_3);
CREATE INDEX lh_departament_disabled_hidden ON lh_departament (disabled, hidden);
CREATE INDEX lh_departament_sort_priority_name ON lh_departament (sort_priority, name);
CREATE INDEX lh_departament_active_mod ON lh_departament (online_hours_active,mod_start_hour,mod_end_hour);
CREATE INDEX lh_departament_active_tud ON lh_departament (online_hours_active,tud_start_hour,tud_end_hour);
CREATE INDEX lh_departament_active_wed ON lh_departament (online_hours_active,wed_start_hour,wed_end_hour);
CREATE INDEX lh_departament_active_thd ON lh_departament (online_hours_active,thd_start_hour,thd_end_hour);
CREATE INDEX lh_departament_active_frd ON lh_departament (online_hours_active,frd_start_hour,frd_end_hour);
CREATE INDEX lh_departament_active_sad ON lh_departament (online_hours_active,sad_start_hour,sad_end_hour);
CREATE INDEX lh_departament_active_sud ON lh_departament (online_hours_active,sud_start_hour,sud_end_hour);

CREATE SEQUENCE lh_departament_group_user_seq;

CREATE TABLE IF NOT EXISTS lh_departament_group_user (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_departament_group_user_seq'),
                  dep_group_id int NOT NULL,
                  user_id int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX lh_departament_group_user_dep_group_id ON lh_departament_group_user (dep_group_id);
CREATE INDEX lh_departament_group_user_user_id ON lh_departament_group_user (user_id);

CREATE SEQUENCE lh_abstract_product_departament_seq;

CREATE TABLE IF NOT EXISTS lh_abstract_product_departament (
        	       id int NOT NULL DEFAULT NEXTVAL ('lh_abstract_product_departament_seq'),
        	       product_id int NOT NULL,
        	       departament_id int NOT NULL,
        	       PRIMARY KEY (id)
        	   );

CREATE INDEX lh_abstract_product_departament_departament_id ON lh_abstract_product_departament (departament_id);

CREATE SEQUENCE lh_departament_group_member_seq;

CREATE TABLE IF NOT EXISTS lh_departament_group_member (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_departament_group_member_seq'),
                  dep_id int NOT NULL,
                  dep_group_id int NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX lh_departament_group_member_dep_group_id ON lh_departament_group_member (dep_group_id);

CREATE SEQUENCE lh_departament_group_seq;

CREATE TABLE IF NOT EXISTS lh_departament_group (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_departament_group_seq'),
                  name varchar(50) NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE SEQUENCE lh_canned_msg_tag_link_seq;

CREATE TABLE IF NOT EXISTS lh_canned_msg_tag_link (  
		id int NOT NULL DEFAULT NEXTVAL ('lh_canned_msg_tag_link_seq'),  
		tag_id int NOT NULL,
		canned_id int NOT NULL,  
		PRIMARY KEY (id) 
	) 
	;

CREATE INDEX lh_canned_msg_tag_link_canned_id ON lh_canned_msg_tag_link (canned_id);
CREATE INDEX lh_canned_msg_tag_link_tag_id ON lh_canned_msg_tag_link (tag_id);

CREATE SEQUENCE lh_canned_msg_tag_seq;

CREATE TABLE IF NOT EXISTS lh_canned_msg_tag (  
		id int NOT NULL DEFAULT NEXTVAL ('lh_canned_msg_tag_seq'),  
		tag varchar(40) NOT NULL, 
		PRIMARY KEY (id) 
	) 
	;

CREATE INDEX lh_canned_msg_tag_tag ON lh_canned_msg_tag (tag);

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

CREATE INDEX lh_departament_custom_work_hours_dep_id ON lh_departament_custom_work_hours (dep_id);
CREATE INDEX lh_departament_custom_work_hours_date_from ON lh_departament_custom_work_hours (date_from);
CREATE INDEX lh_departament_custom_work_hours_search_active ON lh_departament_custom_work_hours (date_from, date_to, dep_id);

CREATE SEQUENCE lh_group_seq;

CREATE TABLE IF NOT EXISTS lh_group (
               id int NOT NULL DEFAULT NEXTVAL ('lh_group_seq'),
               name varchar(50) NOT NULL,
               disabled int NOT NULL,
               PRIMARY KEY (id)
               );

CREATE INDEX lh_group_disabled ON lh_group (disabled);

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

CREATE INDEX lh_grouprole_group_id ON lh_grouprole (role_id,group_id);
CREATE INDEX lh_grouprole_group_id_primary ON lh_grouprole (group_id);

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

CREATE INDEX lh_users_hide_online ON lh_users (hide_online);
CREATE INDEX lh_users_rec_per_req ON lh_users (rec_per_req);
CREATE INDEX lh_users_email ON lh_users (email);
CREATE INDEX lh_users_xmpp_username ON lh_users (xmpp_username);

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

CREATE INDEX lh_userdep_last_activity_hide_online_dep_id ON lh_userdep (last_activity,hide_online,dep_id);
CREATE INDEX lh_userdep_dep_id ON lh_userdep (dep_id);
CREATE INDEX lh_userdep_user_id_type ON lh_userdep (user_id,type);



CREATE SEQUENCE lh_group_work_seq;

CREATE TABLE IF NOT EXISTS lh_group_work (  
		id int NOT NULL DEFAULT NEXTVAL ('lh_group_work_seq'),  
		group_id int NOT NULL, 
		group_work_id int NOT NULL, 
		PRIMARY KEY (id) 
	) 
	;

CREATE INDEX lh_group_work_group_id ON lh_group_work (group_id);

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

CREATE INDEX lh_transfer_dep_id ON lh_transfer (dep_id);
CREATE INDEX lh_transfer_transfer_user_id_dep_id ON lh_transfer (transfer_user_id,dep_id);
CREATE INDEX lh_transfer_transfer_to_user_id ON lh_transfer (transfer_to_user_id);

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

CREATE INDEX lh_abstract_rest_api_key_api_key ON lh_abstract_rest_api_key (api_key);
CREATE INDEX lh_abstract_rest_api_key_user_id ON lh_abstract_rest_api_key (user_id);

CREATE SEQUENCE lh_users_session_seq;

CREATE TABLE IF NOT EXISTS lh_users_session (
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

CREATE INDEX lh_users_session_device_token_device_type ON lh_users_session (device_token,device_type);
CREATE INDEX lh_users_session_token ON lh_users_session (token);

CREATE SEQUENCE lh_msg_seq;

CREATE TABLE IF NOT EXISTS lh_msg (
		  id int NOT NULL DEFAULT NEXTVAL ('lh_msg_seq'),
		  msg text NOT NULL,
		  time int NOT NULL,
		  chat_id int NOT NULL DEFAULT '0',
		  user_id int NOT NULL DEFAULT '0',
		  name_support varchar(100) NOT NULL,
		  PRIMARY KEY (id)
		);

CREATE INDEX lh_msg_chat_id_id ON lh_msg (chat_id, id);
CREATE INDEX lh_msg_user_id ON lh_msg (user_id);

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

CREATE INDEX lh_groupuser_group_id ON lh_groupuser (group_id);
CREATE INDEX lh_groupuser_user_id ON lh_groupuser (user_id);
CREATE INDEX lh_groupuser_group_id_2 ON lh_groupuser (group_id,user_id);

CREATE SEQUENCE lh_rolefunction_seq;

CREATE TABLE IF NOT EXISTS lh_rolefunction (
                  id int NOT NULL DEFAULT NEXTVAL ('lh_rolefunction_seq'),
                  role_id int NOT NULL,
                  module varchar(100) NOT NULL,
                  function varchar(100) NOT NULL,
                  PRIMARY KEY (id)
                );

CREATE INDEX lh_rolefunction_role_id ON lh_rolefunction (role_id);
COMMIT;
