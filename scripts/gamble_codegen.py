import csv

with open("game_economy.csv") as csv_file :


    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            line_count += 1
        else:
            print("let {} = Gamble.init(name: \"{}\", image: \"{}\", profitProbability : {}, winText:\"{}\", lossText :\"{}\", profitAmount :{}, lossAmount: {}, demotion :\"{}\")").format(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8])
