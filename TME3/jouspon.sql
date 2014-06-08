SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT P_Sponsor PROMPT "Donnez un sponsor : "
execute PROCjouspon('&P_Sponsor');
