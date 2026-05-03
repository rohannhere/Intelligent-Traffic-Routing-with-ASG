```mermaid
graph TD
    %% Define Nodes and Styling
    Client([🌐 Users / Internet])
    ALB{Application Load Balancer}
    
    %% Target Groups
    TG_Home[Target Group: tg-home]
    TG_Mobile[Target Group: tg-mobile]
    TG_Laptop[Target Group: tg-laptop]
    
    %% Auto Scaling Groups
    ASG_Home[[Home ASG <br> Dynamic Scaling]]
    ASG_Mobile[[Mobile ASG <br> Static Scaling]]
    ASG_Laptop[[Laptop ASG <br> Scheduled Scaling]]

    %% Routing Rules
    Client -->|HTTP 80| ALB
    ALB -->|Path: /*| TG_Home
    ALB -->|Path: /mobile/*| TG_Mobile
    ALB -->|Path: /laptop/*| TG_Laptop

    %% ASG Connections
    TG_Home --> ASG_Home
    TG_Mobile --> ASG_Mobile
    TG_Laptop --> ASG_Laptop

    %% Infrastructure Subgraphs
    subgraph Home Environment
        ASG_Home -.->EC2_H1(EC2 Instance)
        ASG_Home -.-> EC2_H2(EC2 Instance)
    end

    subgraph Mobile Environment
        ASG_Mobile -.->EC2_M1(EC2 Instance)
        ASG_Mobile -.-> EC2_M2(EC2 Instance)
    end

    subgraph Laptop Environment
        ASG_Laptop -.->EC2_L1(EC2 Instance)
        ASG_Laptop -.-> EC2_L2(EC2 Instance)
    end
    
    %% Apply Colors
    classDef loadbalancer fill:#8c4fff,stroke:#fff,stroke-width:2px,color:#fff;
    classDef targetgroup fill:#ff9900,stroke:#fff,stroke-width:2px,color:#fff;
    classDef autoscaling fill:#ff4f8b,stroke:#fff,stroke-width:2px,color:#fff;
    
    class ALB loadbalancer;
    class TG_Home,TG_Mobile,TG_Laptop targetgroup;
    class ASG_Home,ASG_Mobile,ASG_Laptop autoscaling;
    ```
