import Foundation

print("Enter migrating version tag")
let input = readLine()

let process = Process()
let pipe = Pipe()

process.executableURL = URL(fileURLWithPath: "/bin/zsh")
process.arguments = [
	"-c",
	"curl -L https://github.com/link-coder100788/WhatDidIDo/archive/refs/tags/\(input!).tar.gz | shasum -a 256"
]

process.standardOutput = pipe

try process.run()
process.waitUntilExit()

let data = pipe.fileHandleForReading.readDataToEndOfFile()
let output = String(data: data, encoding: .utf8)!

print(output)

print("Commit MSG:")
print("Update SHA256 and URL for \(input!)")

