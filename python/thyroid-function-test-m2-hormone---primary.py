# S Jill Stocks, Evangelos Kontopantelis, Artur Akbarov, Sarah Rodgers, Anthony J Avery, Darren M Aschroft, 2024.

import sys, csv, re

codes = [{"code":"442..00","system":"readv2"},{"code":"442A.00","system":"readv2"},{"code":"442C.00","system":"readv2"},{"code":"C134300","system":"readv2"},{"code":"4423","system":"readv2"},{"code":"442h.00","system":"readv2"},{"code":"442Z.00","system":"readv2"},{"code":"4422","system":"readv2"},{"code":"442B.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('thyroid-function-test-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["thyroid-function-test-m2-hormone---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["thyroid-function-test-m2-hormone---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["thyroid-function-test-m2-hormone---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
