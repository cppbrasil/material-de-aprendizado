# Manifesto de Ensino em C++

Ensinar C++ é uma tarefa difícil, tanto para os alunos quanto para os professores.
Este manifesto pretende garantir que esta tarefa não seja involuntariamente tão dolorosa para ambas as partes,
fornecendo as melhores práticas atualizadas para o ensino.


#### 1. Ensinarei C++ como uma linguagem de alto nível
* Muitos cursos adotam a abordagem de apresentar C++ no mesmo nível de abstração que C. Isso é **muito** equivocado.
  * Os programas em C++ são escritos para a "máquina abstrata" de C++, não para as CPUs da sua sala de aula, e os compiladores * otimizarão o código com as suposições da "máquina abstrata" em mente.
  * C++ permite níveis arbitrariamente altos de abstrações, geralmente sem penalidade de tempo de execução para o código otimizado, tanto para *inlining* quanto para otimização de tempo de linkagem ([*linking*][linking]).
  * [Expressive C++ Coding Challenge Results - Inglês](https://www.bfilipek.com/2017/10/expressive-cpp17-results.html)

#### 2. Ensinarei os principais conceitos e valores de C++
* Semântica de valor.
* Corretude na utilização de `const`.
* *Ownership* e [*RAII*][RAII], gerenciamento de recursos.
* Abstrações de custo zero.
* Programação genérica e como aproveitar o sistema de tipos para fornecer garantias máximas em tempo de compilação em seu programa.
  * Em particular, evitando fazer em tempo de execução o que pode ser feito em tempo de compilação.

#### 3. Vou me referir e me manter atualizado com as melhores práticas atuais
* Os autores e designers de C++ criaram as [Diretrizes Principais do C++ (*C++ Core Guidelines*)][cppcoreguidelines], para informar qual é a melhor prática, em um idioma com mais de 40 anos de bagagem herdada.
* [Collaborative Collection of C++ Best Practices](https://github.com/lefticus/cppbestpractices)

#### 4. Não ensinarei o uso de versões desatualizadas do padrão C++
* As regras da *ISO* exigem que o **único** padrão válido seja o último disponível.
    * Não construímos casas novas com tomadas elétricas de 50 anos atrás.
* Existe uma versão nova de C++ a cada três anos aproximadamente: quando os estudantes estiverem no mercado de trabalho, o que foi considerado de vanguarda durante as aulas será o predominante.
* Não é necessário usar padrões não liberados, mas pode ser interessante, pelo menos, observá-los - esses são os padrões que entrarão em vigor quando os alunos estiverem finalizando seus cursos!

5. Não usarei ferramentas desatualizadas para ensinar meus alunos
* Windows: Prefira o MSYS2 com Clang, GCC ou um MSVC recente o suficiente para suportar o item número 4.
* Ubuntu ou Debian: Se uma distribuição recente não estiver disponível, use os pacotes disponíveis em: https://apt.llvm.org/
* Mac: Prefira uma versão do MacOS recente com o Xcode mais recente disponível ou instale o GCC/LLVM mais recente do [*Homebrew*][homebrew] se o MacOS não puder ser atualizado.

#### 6. Não ensinarei C++ como uma linguagem orientada a objetos
* Porque não é. Pela própria palavra de seu criador, é uma linguagem multiparadigma.
* Curiosidade: C++ é uma linguagem funcional bastante avançada, graças à computações a nível de tipos, e algum nível de [tipagem dependente][dependent_type] (parâmetros de [*template*][cppreference_template] que não são tipos).
* C++ pode ser aproveitado para estudar quase toda a história da programação, então vamos aproveitar isso e fornecer bons exemplos para nossos alunos.

#### 7. Não ensinarei dialetos especificos ou de plataformas em C++
* Sem "C/C++": [CppCon 2015: Kate Gregory “Stop Teaching C"](https://www.youtube.com/watch?v=YnWhqhNdYyk).
* Sem C-com-classes: apenas ensine C ou Java se você realmente quiser fazer isso.
* Sem "Java/C++". Dica: se você estiver escrevendo `new std::string`, há algo errado.
* Sem `-fno-exceptions`: as exceções são uma parte essencial do C++. Elas dão todo o seu significado ao [*RAII*][RAII] e, exceto no Windows de 32 bits, são mais rápidas no "caminho feliz" do que retornar códigos de erro.
  * É mais fácil aprender a não usar exceções, se você já as conhece, do que aprender a usar exceções, se não.
* Sem `conio.h` / `iostream.h` / `graphics.h` / qualquer [API][api] da era do DOS que você possa encontrar.

#### 8. Não ensinarei padrões de desenvolvimento de software desatualizados
Ao longo dos anos, vários padrões clássicos de desenvolvimento foram integrados em várias linguagens de programação, como recursos de linguagem ou biblioteca.
* [*Closed polymorphism*][open_closed_principle]: [*visitor pattern*][visitor_pattern] -> Podem ser feitos com `std::variant`
* [*Strategy pattern*][strategy]: Pode ser feito com `std::function`

#### 9. Não ensinarei o `volatile` como um mecanismo de sincronização [*multithread*][multithreading]
* Resumindo: Não funciona na maioria dos casos.
* [`volatile` é util com threads ?](http://cxx.isvolatileusefulwiththreads.com/)
* Use [`atomics`][cppreference_atomic].

[api]: https://pt.wikipedia.org/wiki/Interface_de_programa%C3%A7%C3%A3o_de_aplica%C3%A7%C3%B5es
[cppreference_atomic]: https://pt.cppreference.com/w/cpp/atomic
[cppreference_template]: https://en.cppreference.com/w/cpp/language/templates
[open_closed_principle]: https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle
[cppcoreguidelines]: https://github.com/isocpp/CppCoreGuidelines
[dependent_type]: https://en.wikipedia.org/wiki/Dependent_type
[homebrew]: https://brew.sh/index_pt-br
[linking]: https://pt.wikipedia.org/wiki/Ligador
[multithreading]: https://en.wikipedia.org/wiki/Multithreading_(computer_architecture)
[RAII]: https://pt.wikipedia.org/wiki/Aquisi%C3%A7%C3%A3o_de_Recurso_%C3%A9_Inicializa%C3%A7%C3%A3o
[strategy]: https://pt.wikipedia.org/wiki/Strategy
[visitor_pattern]: https://pt.wikipedia.org/wiki/Visitor_Pattern

Versão e autor original do manifesto: [The C++ Teaching Manifesto - Jean-Michaël Celerier (@jcelerier)](https://github.com/jcelerier/cpp-teaching-manifesto)
