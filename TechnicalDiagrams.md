## System Architecture

```mermaid
flowchart TD
    %% Components
    User -->|Interacts with| Frontend
    Frontend -->|Sends cropped image| Backend
    Backend -->|Stores data| Database
    Backend -->|Forwards image| VideoAnalyser
    VideoAnalyser -->|Returns classification tags| Backend
    Backend -->|Sends tags| EcomAPI
    EcomAPI -->|Searches products| EcommerceAPIs
    EcommerceAPIs -->|Returns product data| EcomAPI
    EcomAPI -->|Sends product data| Backend
    Backend -->|Returns product links| Frontend
    Frontend -->|Displays results| User

    %% Containerization
    subgraph Containerized_Environment
        Frontend
        Backend
        Database
        EcomAPI
    end

    subgraph Host_System
        VideoAnalyser
    end

    %% External API
    subgraph External_Systems
        EcommerceAPIs
    end
```

## Data Flow Diagram

```mermaid
flowchart LR
    %% External Entities
    User((User)) -->|Crops Video Frame| Frontend[Frontend]

    %% Process 1: User Interaction and Data Capture
    Frontend -->|Sends Cropped Image| Backend[Backend System]
    Backend -->|Stores Image| Database[(Database)]

    %% Process 2: Image Classification
    Backend -->|Forwards Image| VideoAnalyser[VideoAnalyser]
    VideoAnalyser -->|Classifies Image| Backend

    %% Process 3: E-commerce Search
    Backend -->|Sends Classification Tags| EcomAPI[EcomAPI]
    EcomAPI -->|Searches for Products| ExternalAPIs[External E-commerce APIs]
    ExternalAPIs -->|Returns Product Data| EcomAPI
    EcomAPI -->|Sends Product Data| Backend

    %% Process 4: Display Results to User
    Backend -->|Sends Product Links| Frontend
    Frontend -->|Displays Results| User
```

