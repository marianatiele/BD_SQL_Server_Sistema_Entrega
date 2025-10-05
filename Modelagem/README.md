## Plano de Execução: 
Este plano de execução é da seguinte consulta:

```bash
select c.cpf, c.nome, c.telefone, p.itens, p.total_pedido
from cliente c join pedido p on p.cpf = c.cpf;
```

## Imagem do Plano de Execução:

<img width="728" height="263" alt="image" src="https://github.com/user-attachments/assets/a9cef2f2-d412-4054-b91c-88cb9d6a4eaa" />

