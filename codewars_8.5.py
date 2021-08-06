def two_sum(numbers, target):
    sum_dict = {i: numbers[i] for i in range(len(numbers))}
    for i in range(len(numbers)):
        dif = target - numbers[i]
        if dif in numbers:
            return (i, numbers.index(dif))
    