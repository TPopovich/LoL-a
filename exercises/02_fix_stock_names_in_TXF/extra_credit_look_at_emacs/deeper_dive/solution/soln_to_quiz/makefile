all:
	@echo "complete solution taking data sample_stock_records and generate elisp conversion cmds"
	awk -f extract_ticker_text.awk < sample_stock_records.txt | awk -f postprocess.awk

part1:
	awk -f extract_ticker_text.awk < sample_stock_records.txt

alt:
	@echo "complete solution using postprocess2.awk"
	awk -f extract_ticker_text.awk < sample_stock_records.txt | awk -f postprocess2.awk
