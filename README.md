# DiffableSamples

This repo is show you samples of differential update library.

## Libraries

- [ra1028/DifferenceKit](https://github.com/ra1028/DifferenceKit)
- [RxSwiftCommunity/RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources)
- 🚧 UITableViewDiffableDataSource on iOS 13 🚧

## Demo

```swift
static let source = [
    ArraySection(model: "Section 1", elements: ["A", "B", "C"]),
    ArraySection(model: "Section 2", elements: ["D", "E", "F"]),
    ArraySection(model: "Section 3", elements: ["G", "H", "I"]),
    ArraySection(model: "Section 4", elements: ["J", "K", "L"])
]

static let target = [
    ArraySection(model: "Section 5", elements: ["M", "N", "O"]),
    ArraySection(model: "Section 1", elements: ["A", "C"]),
    ArraySection(model: "Section 4", elements: ["J", "I", "K", "L"]),
    ArraySection(model: "Section 3", elements: ["G", "H", "Z"]),
    ArraySection(model: "Section 6", elements: ["P", "Q", "R"])
]
```

|   DifferenceKit   |   RxDataSources   |
| :--: | :--: |
|   <img src="https://user-images.githubusercontent.com/26145133/75958237-247c0380-5eff-11ea-89cb-492ae713ef99.gif" >   |   <img src="https://user-images.githubusercontent.com/26145133/75958237-247c0380-5eff-11ea-89cb-492ae713ef99.gif" >   |
