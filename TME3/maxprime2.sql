SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT A_Sponsor  PROMPT 'Nom du sponsor: '
execute PROCmaxprime2('&A_Sponsor');
