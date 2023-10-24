struct StringIterator:
    var data: String
    var current_index: Int
    var data_length: Int
    var delimiter: String

    fn __init__(inout self, string: String, delimiter: String = "\n"):
        self.data = string
        self.data_length = len(string)
        self.current_index = 0
        self.delimiter = delimiter

    fn __iter__(self) -> Self:
        return Self(self.data)

    fn __next__(inout self) raises -> String:
        for idx in range(self.current_index, self.data_length):
            if self.data[idx] == self.delimiter or idx == self.data_length - 1:
                let return_string: String = self.data[self.current_index : idx]
                self.current_index = idx + 1
                return return_string
        raise Error("End of iteration")

    fn __len__(self) -> Int:
        return self.data_length - (self.current_index + 1)