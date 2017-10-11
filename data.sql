
--sentiment
--drop table innovation_201710_sentiment
select *
into innovation_201710_sentiment
from (values 
('not really excited', 'negative'),
('horrible taste', 'negative'),
('I do not like the car', 'negative'),
('great view', 'positive'),
('amazing innovation', 'positive')
)as tbl(string, label)

select * from innovation_201710_sentiment

--drop table innovation_201710_rqcount
select year(ACTION_DATE)*100+month(action_date) as yearmon, count(*) as rq_count
into innovation_201710_rqcount
from dsol.dbo.tblca_RQ
where action_date between '20150101' and '20170630'
group by year(ACTION_DATE)*100+month(action_date)

--drop table innovation_201710_modelfit
select a.user_ref,a.gbf,z_name_time_0,z_dft,th_nonDASR_enq_count,z_sa24_dist_sub,z_sat_dist_acc,TPE_WORST_STATUS_0
into innovation_201710_modelfit
from comm_imp_cth_out_cth a
left join comm_imp_cth_char_com b on a.user_ref=b.user_ref
left join comm_imp_myttTPE_chars c on a.user_ref=c.user_ref
where a.TPE_LAST_24_MONTHS=1 and tpe_th_com_master_scale>-900
