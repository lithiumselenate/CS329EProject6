
  
    

    create or replace table `silken-fortress-448205-p9`.`dbt_cs329e_xh_stg`.`single_registrations`
      
    
    

    OPTIONS()
    as (
      
with t1 as (
select
    case bcn when '(b)(6)' THEN NULL ELSE bcn END AS bcn,
    case receipt_number when '(b)(6)' THEN NULL ELSE receipt_number END AS receipt_number,
    case ben_date_of_birth when '(b)(6)' THEN NULL ELSE ben_date_of_birth END AS ben_date_of_birth,
    case dol_eta_case_number when '(b)(6)' THEN NULL ELSE dol_eta_case_number END AS dol_eta_case_number,
    *
EXCEPT (bcn, receipt_number, ben_date_of_birth, dol_eta_case_number)
FROM `silken-fortress-448205-p9`.`cs329e_xh_raw`.`single_registrations`
WHERE bcn != '(b)(3) (b)(6) (b)(7)(c)'
)
, t2 as (select * except(bcn, receipt_number, ben_date_of_birth, dol_eta_case_number, t_u_vawa_flag)
FROM t1)
select * from t2
    );
  