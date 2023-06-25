<h1 align="center">Students CLI - Academia do Flutter</h1><br />

<h2 align="center">Projeto de CLI desenvolvido no módulo LAB Alunos ADF, lista de comandos disponíveis:</h2><br />

<table style="width: 100%" align="center">
  <thead>
    <tr>
      <th align="center">
        <p align="center"> 
          <small>
            COMMANDS
          </small>
        </p>
      </th>
      <th align="center">
        <p align="center"> 
          <small>
            DESCRIPTION
          </small>
        </p>
      </th>
      <th align="center">
        <p align="center"> 
          <small>
            SUBCOMMANDS
          </small>
        </p>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>deleteById</code></td>
      <td>Delete a student by your id</td>
      <td>
        <table style="width: 100%">
          <thead>
            <tr>
              <th align="center">
                <p align="center"> 
                  <small>
                    OPTIONS
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    ABBR
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    DESCRIPTION
                  </small>
                </p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>--help</td>
              <td>--h</td>
              <td>Print this usage information.</td>
            </tr>
            <tr>
              <td>--id</td>
              <td>--i</td>
              <td>Id of the student to be deleted.</td>
            </tr>
          </tbody>
        </table style="width: 100%">
      </td>
    </tr>
    <tr>
      <td><code>findAll</code></td>
      <td>Find all students</td>
      <td>
        <table style="width: 100%">
          <thead>
            <tr>
              <th align="center">
                <p align="center"> 
                  <small>
                    OPTIONS
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    ABBR
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    DESCRIPTION
                  </small>
                </p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>--help</td>
              <td>--h</td>
              <td>Print this usage information.</td>
            </tr>
          </tbody>
        </table style="width: 100%">
      </td>
    </tr>
    <tr>
      <td><code>findById</code></td>
      <td>Find a single student by your id</td>
      <td>
        <table style="width: 100%">
          <thead>
            <tr>
              <th align="center">
                <p align="center"> 
                  <small>
                    OPTIONS
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    ABBR
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    DESCRIPTION
                  </small>
                </p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>--help</td>
              <td>--h</td>
              <td>Print this usage information.</td>
            </tr>
            <tr>
              <td>--id</td>
              <td>--i</td>
              <td>Student id.</td>
            </tr>
          </tbody>
        </table style="width: 100%">
      </td>
    </tr>
    <tr>
      <td><code>insert</code></td>
      <td>Insert one or more new students</td>
      <td>
        <table style="width: 100%">
          <thead>
            <tr>
              <th align="center">
                <p align="center"> 
                  <small>
                    OPTIONS
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    ABBR
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    DESCRIPTION
                  </small>
                </p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>--help</td>
              <td>--h</td>
              <td>Print this usage information.</td>
            </tr>
            <tr>
              <td>--file</td>
              <td>--f</td>
              <td>CSV file path to insert.</td>
            </tr>
          </tbody>
        </table style="width: 100%">
      </td>
    </tr>
    <tr>
      <td><code>update</code></td>
      <td>Update one student</td>
      <td>
        <table style="width: 100%">
          <thead>
            <tr>
              <th align="center">
                <p align="center"> 
                  <small>
                    OPTIONS
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    ABBR
                  </small>
                </p>
              </th>
              <th align="center">
                <p align="center"> 
                  <small>
                    DESCRIPTION
                  </small>
                </p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>--help</td>
              <td>--h</td>
              <td>Print this usage information.</td>
            </tr>
            <tr>
              <td>--file</td>
              <td>--f</td>
              <td>CSV file path to get updated data.</td>
            </tr>
            <tr>
              <td>--id</td>
              <td>--i</td>
              <td>Id of user to update.</td>
            </tr>
          </tbody>
        </table style="width: 100%">
      </td>
    </tr>
  </tbody>
</table style="width: 100%">

## Como executar:

```bash
# Clone este projeto
$ git clone https://github.com/vagnereix/flutter_academy.git

# Acesse
$ cd flutter_academy/6_students_cli

# Instale as dependências
$ flutter pub get

# Em um outro terminal acesse
$ cd backend

# Execute o backend local
# Você precisará do json_rest_server instalado globalmente
$ jrs run

# Rode o projeto para ter acesso à lista de comandos
$ dart ./bin/main.dart students -h
```
