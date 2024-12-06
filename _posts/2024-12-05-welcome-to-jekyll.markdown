---
layout: post
title:  "Welcome to My Research Page"
date:   2024-12-05 17:00:13
categories: research projects
permalink: /archivers/research
---

Welcome to my webpage! Here, you can learn about my research activities, projects, and contributions. I’m pursuing a PhD with a focus on **Class Expression Learning with Multiple Representations**, and I’ve been actively working on cutting-edge topics like knowledge graph embeddings, ontology-based retrieval, and caching algorithms.

<!--more-->

### Publications
To see all my publications, please refer to my [My google scholar profile](https://scholar.google.com/citations?user=IS0OrxIAAAAJ&hl=en)

### Current Works

#### 1. **Implementation of Caching Mechanisms for Fast Instance Retrieval**  
Efficient instance retrieval is vital for ontology-based reasoning systems. My approach introduces a **semantics-aware caching strategy** to accelerate concept learning:  
- The cache $$\mathcal{A}$$ functions as a **subsumption-aware map**, linking concepts to a set of instances.  
- Given a concept $$C$$, $$\mathcal{A}$$ identifies the most specific concept $$D$$ in its storage such that $$C \sqsubseteq D$$ (where $$D$$ subsumes $$C$$).  
- This approach minimizes redundant evaluations by testing $C$ only against the instances of $$D$$.  

#### 2. **Instance Retrieval with Embedding-Based Reasoners on incomplete Knowledge bases**  
This project focuses on leveraging **embeddings** to optimize instance retrieval in OWL ontologies. Key aspects include:  
- **Subsumption-based caching**: Integrating subsumption relationships to refine retrieval.  
- **Jaccard similarity**: Enhancing performance by comparing instance sets during retrieval.  


##### Example of Concepts retrieval results on Father dataset:

|   | Expression             | Type                     | Jaccard Similarity | F1  | Runtime Benefits      | Runtime EBR        | Symbolic Retrieval                                                                                                                                               | EBR Retrieval                                                                                                                                         |
|---|------------------------|--------------------------|--------------------|-----|-----------------------|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0 | female ⊓ male          | IntersectionOf   | 1.0                | 1.0 | 0.054    | 0.003    | set()                                                                                                                                                            | set()                                                                                                                                                            |
| 1 | ∃ hasChild.female       | SomeValuesFrom   | 1.0                | 1.0 | -0.001 | 0.001  | {'markus'}                                                                                                                             | {'markus'}                                                                                                                             |
| 3 | person ⊓ male         | IntersectionOf  | 1.0                | 1.0 | -0.002   | 0.002    | {'martin', 'stefan', 'markus'} | {'martin', 'stefan', 'markus'} |
| 4 | male ⊔ female         | UnionOf         | 1.0                | 1.0 | -0.002  | 0.002   | {'martin', 'stefan', 'anna', 'markus', 'michelle', 'heinz'} | {'martin', 'stefan', 'anna', 'markus', 'michelle', 'heinz'} |

---

### Previous Works  

I have developed two main knowledge graph embedding models, both accepted at academic venues. These models laid the foundation for advanced ontology representation learning.

#### 1. **Embedding-in-Function-Spaces**  
![fspace_logo](Louis-Mozart.github.io/photos/LFMult1.pdf)

This work explores the idea of representing embeddings in **function spaces** rather than traditional vector spaces. We present novel embedding methods that operate in function spaces rather than traditional finite vector spaces, enabling greater expressiveness and flexibility. Starting with polynomial functions and advancing to neural networks, the approach supports operations like composition, derivatives, and primitives of entity representations. Benefits include:  
- Improved reasoning capabilities.  
- Enhanced flexibility in capturing complex relationships.  

For more details: [Embedding-in-Function-Spaces](https://dl.acm.org/doi/10.1145/3627673.3679819)


#### 2. **Clifford Embeddings**  
![cliff_logo](Louis-Mozart.github.io/photos/funcspace.png)

This work introduces degenerate [Clifford algebras](https://en.wikipedia.org/wiki/Clifford_algebra), a generalization that incorporates nilpotent base vectors to unify translations and rotations in knowledge graph embeddings. By developing both greedy search and neural network-based methods to optimize algebra parameters, the approach achieves state-of-the-art performance on seven benchmark datasets, particularly excelling in generalization and mean reciprocal rank. This demonstrates the potential of [dual numbers](https://en.wikipedia.org/wiki/Dual_number) in enhancing embedding quality and broadening the applicability of Clifford algebras.

To know more about this work, please refer to [Embedding in degenerate Cliffors algebras](https://ebooks.iospress.nl/doi/10.3233/FAIA240627)


---

### Software contribution

I have been dealing with a lot software to conduct my reasearch but the main software where I am contributing for my reasearch: 

#### 1. [Ontolearn](https://github.com/dice-group/Ontolearn)

- **Ontology Instance Retrieval**: Developing algorithms for efficient instance retrieval that leverage **ontology reasoning** and **embedding-based methods**.  
- **Semantic-Based Caching**: Implementing advanced caching strategies for ontology instance retrieval, focusing on **LIFO purging** and **similarity-based performance evaluations**.  

#### 2. [Dice-embeddings](https://github.com/dice-group/dice-embeddings)
- **Functional Embeddings**: Exploring novel methods to represent and learn **complex OWL class expressions** using **multiple representations**.  
- **Clifford Embeddings**:  Exploring degenerate clifford Algebras to represent and learn **complex OWL class expressions** using **multiple representations**. 

---

### Links

- [My Google-Scholar profile](https://scholar.google.com/citations?user=IS0OrxIAAAAJ&hl=en)
- [My GitHub Profile](https://github.com/Louis-Mozart)  
- [Embedding-in-function-spaces](https://github.com/Louis-Mozart/Embedding-in-function-spaces)  
- [Lemur-dn Repository](https://github.com/Louis-Mozart/Lemur-dn/lemur-dn.github.io)

---

### Contact Me

Feel free to connect with me for collaboration, feedback, or research discussions.  
You can reach out via GitHub or through this webpage.


Thank you for visiting my webpage! Feel free to explore my research further or reach out for collaboration opportunities.
